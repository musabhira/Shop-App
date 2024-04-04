abstract class AuthFirebaseDataSource {
  Future<void> googleSignIn();
  Future<void> signOut();
  Future<(String, int?)> loginWithPhone(String phone);
  Future<void> verifyOtp(String verificationId, String otp);
}
