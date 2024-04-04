import 'package:shopapp/core/auth/base_exception.dart';
import 'package:shopapp/core/auth/invalid_exception.dart';
import 'package:shopapp/features/Authentication/domain/repository/auth_repository.dart';

final class VerifyOtpUsecase {
  final AuthenticationRepository repository;
  VerifyOtpUsecase({required this.repository});
  Future<void> call(String verificationId, String otp) async {
    if (otp.trim().isEmpty) {
      throw InvalidCredentialsException();
    }
    try {
      await repository.verifyOtp(verificationId, otp);
    } on Exception {
      throw BaseException('Enter your otp correctly,try again');
    }
  }
}
