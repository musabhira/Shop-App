abstract class AuthenticationRepository {
  Future<void> signOut();
  Future<void> googleSignIn();
  Future<(String, int?)> loginWithPhone(String phone);
  Future<void> verifyOtp(String verificationId, String otp);
}
