import 'package:shopapp/core/auth/base_exception.dart';

class SigninException extends BaseException {
  final String code;
  SigninException(this.code, super.message);
}
