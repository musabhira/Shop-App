import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:shopapp/core/constants/auth_constant/auth_constants.dart';
import 'package:shopapp/core/themes/app_theme.dart';
import 'package:shopapp/features/Authentication/presentation/page/login_phone_number_page.dart';
import 'package:shopapp/features/Authentication/presentation/providers/auth_provider.dart';

class LoginPage extends ConsumerWidget {
  static const routePath = '/login';
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final googleauth = ref.read(authProvider.notifier);
    final theme = AppTheme.of(context);
    final constants = ref.watch(authConstantsProvider);
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: [
            Expanded(
              child: Center(
                child: Container(
                  height: theme.spaces.space_100 * 11.25,
                  width: theme.spaces.space_100 * 22.5,
                  color: Colors.green,
                  child: Center(
                    child: Text(
                      constants.loGOtxt,
                      style: TextStyle(
                          color: theme.colors.textInverse,
                          fontWeight: FontWeight.bold,
                          fontSize: theme.spaces.space_300),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
              child: InkWell(
                onTap: () {
                  googleauth.signinWithGoogle(context, ref);
                },
                child: Container(
                  height: theme.spaces.space_100 * 6.25,
                  decoration: BoxDecoration(
                    color: theme.colors.textSubtle,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/google.jpg',
                        height: theme.spaces.space_100 * 4.25,
                        width: theme.spaces.space_100 * 4.25,
                      ),
                      const SizedBox(width: 2),
                      Text(
                        constants.googletxt,
                        style: TextStyle(
                          fontSize: theme.spaces.space_200,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
              child: InkWell(
                onTap: () {
                  context.push(LoginPageWithPhone.routePath);
                },
                child: Container(
                  height: theme.spaces.space_100 * 6.25,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(
                      constants.phonetxt,
                      style: TextStyle(
                          fontSize: theme.spaces.space_200,
                          fontWeight: FontWeight.w600,
                          color: theme.colors.textInverse),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
