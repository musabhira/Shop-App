import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shopapp/features/Authentication/data/data%20source/auth_firebase_dataSource.dart';
import 'package:shopapp/features/Authentication/data/data%20source/auth_firebase_datasource_impl.dart';
import 'package:shopapp/features/Authentication/domain/repository/auth_repository.dart';

part 'auth_repository_impl.g.dart';

class AuthenticationRepositoryImpl implements AuthenticationRepository {
  final AuthFirebaseDataSource dataSource;
  AuthenticationRepositoryImpl({required this.dataSource});

  @override
  Future<void> signOut() {
    return dataSource.signOut();
  }

  @override
  Future<void> googleSignIn(WidgetRef ref) async {
    await dataSource.googleSignIn(ref);
  }

  @override
  Future<(String, int?)> loginWithPhone(String phone) async {
    return await dataSource.loginWithPhone(phone);
  }

  @override
  Future<void> verifyOtp(
      String verificationId, String otp, WidgetRef ref) async {
    await dataSource.verifyOtp(verificationId, otp, ref);
  }
}

@riverpod
AuthenticationRepository authenticationRepository(
    AuthenticationRepositoryRef ref) {
  return AuthenticationRepositoryImpl(
      dataSource: ref.watch(authFirebaseProvider));
}
