import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shopapp/core/auth/signin_exception.dart';
import 'package:shopapp/core/auth/signup_exception.dart';
import 'package:shopapp/features/Authentication/data/data%20source/auth_firebase_dataSource.dart';
import 'package:shopapp/features/Authentication/data/data%20source/user_firestore_datasource_impl.dart';

part 'auth_firebase_datasource_impl.g.dart';

class AuthFirebaseDataSourceimpl implements AuthFirebaseDataSource {
  final FirebaseAuth _auth;
  AuthFirebaseDataSourceimpl(this._auth);

  @override
  Future<void> googleSignIn(WidgetRef ref) async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      final userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);
      if (userCredential.user != null) {
        ref
            .watch(userFireStoreProvider)
            .createUserDocument(userCredential.user!);
      }
    } on Exception {
      throw SignUpException('Cannot login', 'try again');
    }
  }

  @override
  Future<void> signOut() async {
    await _auth.signOut();
    await GoogleSignIn().signOut();
  }

  @override
  Future<(String, int?)> loginWithPhone(String phone,
      [int? resendToken]) async {
    try {
      final verificationIdCompleter = Completer<String>();
      final resendTokenCompleter = Completer<int?>();

      await FirebaseAuth.instance.verifyPhoneNumber(
        forceResendingToken: resendToken,
        phoneNumber: phone,
        verificationCompleted: (PhoneAuthCredential credential) async {
          await _auth.signInWithCredential(credential);
        },
        verificationFailed: (FirebaseAuthException e) {
          if (e.code == 'invalid-phone-number') {}
        },
        codeSent: (String? verificationId, int? resendToken) async {
          verificationIdCompleter.complete(verificationId);
          resendTokenCompleter.complete(resendToken);
        },
        codeAutoRetrievalTimeout: (String verificationId) async {},
      );

      final verificationId = await verificationIdCompleter.future;
      final newResendToken = await resendTokenCompleter.future;

      return (verificationId, newResendToken);
    } on Exception {
      throw SigninException('cannot login', 'please try again');
    }
  }

  @override
  Future<void> verifyOtp(
      String verificationId, String otp, WidgetRef ref) async {
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId, smsCode: otp);
    final userCredential = await _auth.signInWithCredential(credential);
    if (userCredential.user != null) {
      ref.watch(userFireStoreProvider).createUserDocument(userCredential.user!);
    }
  }
}

@riverpod
AuthFirebaseDataSource authFirebase(AuthFirebaseRef ref) {
  return AuthFirebaseDataSourceimpl(FirebaseAuth.instance);
}
