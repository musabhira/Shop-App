import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shopapp/features/Authentication/presentation/page/login_page.dart';
import 'package:shopapp/features/home/presentation/page/home_page.dart';

part 'router.g.dart';

final _router = GoRouter(
  initialLocation: HomePage.routePath,
  routes: [
    // GoRoute(
    //   path: HomePage.routePath,
    //   builder: (context, state) => const HomePage(),
    //   redirect: (context, state) {
    //     final user = FirebaseAuth.instance.currentUser;
    //     if (user == null || !user.emailVerified && user.phoneNumber == null) {
    //       return LoginPage.routePath;
    //     }
    //     return null;
    //   },
    // ),
    GoRoute(
      path: HomePage.routePath,
      builder: (context, state) => const HomePage(),
    ),
    GoRoute(
      path: LoginPage.routePath,
      builder: (context, state) => const LoginPage(),
    ),
  ],
);

@riverpod
GoRouter router(RouterRef ref) {
  return _router;
}
