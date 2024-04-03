import 'package:shopapp/core/auth/base_exception.dart';

class SignOutException extends BaseException {
  final String code;
  SignOutException(this.code, super.message);
}
