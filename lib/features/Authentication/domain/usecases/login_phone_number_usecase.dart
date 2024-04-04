import 'package:shopapp/core/auth/base_exception.dart';
import 'package:shopapp/core/auth/invalid_exception.dart';
import 'package:shopapp/features/Authentication/domain/repository/auth_repository.dart';

final class LoginwithPhoneNumberUsecase {
  final AuthenticationRepository repository;
  LoginwithPhoneNumberUsecase({required this.repository});
  Future<(String, int?)> call(String phone) async {
    if (phone.trim().isEmpty) {
      throw InvalidCredentialsException();
    }
    try {
      return await repository.loginWithPhone(phone);
    } on Exception {
      throw BaseException('Enter your phone number correctly');
    }
  }
}
