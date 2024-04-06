import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_constants.g.dart';

class AuthConstants {
  final loGOtxt = 'LoGo';
  final googletxt = 'Continue with Google';
  final phonetxt = 'Phone';
}

@riverpod
AuthConstants authConstants(AuthConstantsRef ref) {
  return AuthConstants();
}
