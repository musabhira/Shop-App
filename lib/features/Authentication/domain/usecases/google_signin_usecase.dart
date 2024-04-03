import 'package:shopapp/core/auth/base_exception.dart';
import 'package:shopapp/features/Authentication/domain/repository/auth_repository.dart';

final class GoogleSignInUsecase {
  final AuthenticationRepository repository;

  GoogleSignInUsecase({required this.repository});
  Future<void> call() async {
    try {
      await repository.googleSignIn();
    } on Exception {
      throw BaseException(
        'Cannot login with google',
      );
    }
  }
}
