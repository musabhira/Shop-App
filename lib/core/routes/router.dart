import 'package:firebase_auth/firebase_auth.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shopapp/core/widget/bottom_navigation_bar.dart';
import 'package:shopapp/features/Authentication/presentation/page/login_page.dart';
import 'package:shopapp/features/Authentication/presentation/page/login_phone_number_page.dart';
import 'package:shopapp/features/Authentication/presentation/page/otp_verfication_page.dart';
import 'package:shopapp/features/cart/presentation/page/cart_page.dart';
import 'package:shopapp/features/home/presentation/page/clean_service_page.dart';
import 'package:shopapp/features/home/presentation/page/home_page.dart';
import 'package:shopapp/features/home/presentation/page/profile_page.dart';

part 'router.g.dart';

final _router = GoRouter(
  initialLocation: BottomNaviWidget.routePath,
  routes: [
    GoRoute(
      path: BottomNaviWidget.routePath,
      builder: (context, state) => const BottomNaviWidget(),
      redirect: (context, state) {
        final user = FirebaseAuth.instance.currentUser;
        if (user == null || !user.emailVerified && user.phoneNumber == null) {
          return LoginPage.routePath;
        }
        return null;
      },
    ),
    GoRoute(
      path: HomePage.routePath,
      builder: (context, state) => const HomePage(),
    ),
    GoRoute(
      path: ProfilePage.routePath,
      builder: (context, state) => const ProfilePage(),
    ),
    GoRoute(
      path: CartPage.routePath,
      builder: (context, state) => const CartPage(),
    ),
    GoRoute(
      path: OtpVerificationPage.routePath,
      builder: (context, state) => const OtpVerificationPage(),
    ),
    GoRoute(
      path: LoginPageWithPhone.routePath,
      builder: (context, state) => const LoginPageWithPhone(),
    ),
    GoRoute(
      path: CleanServicePage.routePath,
      builder: (context, state) => const CleanServicePage(),
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
