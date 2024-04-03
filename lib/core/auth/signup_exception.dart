import 'package:shopapp/core/auth/base_exception.dart';

class SignUpException extends BaseException {
  final String code;
  SignUpException(this.code, super.message);
}
