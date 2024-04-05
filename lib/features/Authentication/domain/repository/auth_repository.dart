import 'package:hooks_riverpod/hooks_riverpod.dart';

abstract class AuthenticationRepository {
  Future<void> signOut();
  Future<void> googleSignIn(WidgetRef ref);
  Future<(String, int?)> loginWithPhone(String phone);
  Future<void> verifyOtp(String verificationId, String otp, WidgetRef ref);
}
