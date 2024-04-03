import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shopapp/core/auth/base_exception.dart';
import 'package:shopapp/core/auth/signout_exception.dart';
import 'package:shopapp/core/utils/snack_bar_utils.dart';
import 'package:shopapp/features/Authentication/data/repository/auth_repository_impl.dart';
import 'package:shopapp/features/Authentication/domain/repository/auth_repository.dart';
import 'package:shopapp/features/Authentication/domain/usecases/google_signin_usecase.dart';
import 'package:shopapp/features/Authentication/domain/usecases/signout_usecase.dart';
import 'package:shopapp/features/Authentication/presentation/page/login_page.dart';
import 'package:shopapp/features/Authentication/presentation/providers/auth_state.dart';
import 'package:shopapp/features/home/presentation/page/home_page.dart';

part 'auth_provider.g.dart';

@Riverpod(keepAlive: true)
class Auth extends _$Auth {
  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController passwordcontroller = TextEditingController();
  final TextEditingController namecontroller = TextEditingController();
  final TextEditingController numbercontroller = TextEditingController();
  final TextEditingController confirmcontroller = TextEditingController();
  final TextEditingController phonenumberlogincontroller =
      TextEditingController();
  final TextEditingController otpcontroller = TextEditingController();
  late final AuthenticationRepository repository;

  @override
  AuthState build() {
    repository = ref.read(authenticationRepositoryProvider);
    return AuthState(verificationId: '', resendToken: null);
  }

  Future<void> signinWithGoogle(BuildContext context) async {
    try {
      await GoogleSignInUsecase(repository: repository)();
      Future.sync(() => context.go(HomePage.routePath));
    } on BaseException catch (e) {
      Future.sync(() => SnackbarUtils.showMessage(context, e.message));
    }
  }

  Future<void> signOut(BuildContext context) async {
    try {
      await SignOutUseCase(repository: repository)();
      Future.sync(() => context.go(LoginPage.routePath));
    } on SignOutException catch (e) {
      Future.sync(() => SnackbarUtils.showMessage(context, e.message));
    } on BaseException catch (e) {
      Future.sync(() => SnackbarUtils.showMessage(context, e.message));
    }
  }
}
