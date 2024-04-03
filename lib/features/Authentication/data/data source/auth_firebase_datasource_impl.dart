import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shopapp/core/auth/signup_exception.dart';
import 'package:shopapp/features/Authentication/data/data%20source/auth_firebase_dataSource.dart';

part 'auth_firebase_datasource_impl.g.dart';

class AuthFirebaseDataSourceimpl implements AuthFirebaseDataSource {
  final FirebaseAuth _auth;
  AuthFirebaseDataSourceimpl(this._auth);

  @override
  Future<void> googleSignIn() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      await FirebaseAuth.instance.signInWithCredential(credential);
    } on Exception {
      throw SignUpException('Cannot login', 'try again');
    }
  }

  Future<void> signout() async {
    await _auth.signOut();
    await GoogleSignIn().signOut();
  }

  @override
  Future<void> signOut() async {
    await _auth.signOut();
    await GoogleSignIn().signOut();
  }
}

@riverpod
AuthFirebaseDataSource authFirebase(AuthFirebaseRef ref) {
  return AuthFirebaseDataSourceimpl(FirebaseAuth.instance);
}