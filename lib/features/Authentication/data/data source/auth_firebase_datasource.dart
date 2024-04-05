import 'package:hooks_riverpod/hooks_riverpod.dart';

abstract class AuthFirebaseDataSource {
  Future<void> googleSignIn(WidgetRef ref);
  Future<void> signOut();
  Future<(String, int?)> loginWithPhone(String phone);
  Future<void> verifyOtp(String verificationId, String otp, WidgetRef ref);
}
