import 'package:shopapp/core/auth/signout_exception.dart';
import 'package:shopapp/features/Authentication/domain/repository/auth_repository.dart';

final class SignOutUseCase {
  final AuthenticationRepository repository;
  SignOutUseCase({required this.repository});

  Future<void> call() async {
    try {
      await repository.signOut();
    } on Exception {
      throw SignOutException('Cannot logout', 'Please check network');
    }
  }
}
