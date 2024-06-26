import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopapp/core/auth/base_exception.dart';
import 'package:shopapp/features/Authentication/domain/repository/auth_repository.dart';

final class GoogleSignInUsecase {
  final AuthenticationRepository repository;

  GoogleSignInUsecase({required this.repository});
  Future<void> call(WidgetRef ref) async {
    try {
      await repository.googleSignIn(ref);
    } on Exception {
      throw BaseException(
        'Cannot login with google',
      );
    }
  }
}
