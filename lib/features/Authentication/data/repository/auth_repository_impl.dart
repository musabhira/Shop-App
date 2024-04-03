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
  Future<void> googleSignIn() async {
    await dataSource.googleSignIn();
  }
}

@riverpod
AuthenticationRepository authenticationRepository(
    AuthenticationRepositoryRef ref) {
  return AuthenticationRepositoryImpl(
      dataSource: ref.watch(authFirebaseProvider));
}
