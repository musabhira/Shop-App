abstract class AuthenticationRepository {
  Future<void> signOut();
  Future<void> googleSignIn();
}
