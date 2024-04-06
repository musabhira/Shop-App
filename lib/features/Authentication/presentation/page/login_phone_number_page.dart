import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:shopapp/core/themes/app_theme.dart';
import 'package:shopapp/features/Authentication/presentation/page/login_button_widget.dart';
import 'package:shopapp/features/Authentication/presentation/page/login_page.dart';
import 'package:shopapp/features/Authentication/presentation/providers/auth_provider.dart';
import 'package:shopapp/features/Authentication/presentation/widgets/login_text_button_widget.dart';
import 'package:shopapp/features/Authentication/presentation/widgets/phone_number_container_widget.dart';

class LoginPageWithPhone extends HookConsumerWidget {
  const LoginPageWithPhone({super.key});
  static const routePath = '/loginwithphone';
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.read(authProvider.notifier);
    final theme = AppTheme.of(context);
    final phonenumberController = useTextEditingController();

    return Scaffold(
      backgroundColor: theme.colors.textInverse,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              LoginContainerWidget(
                image: '',
                height: theme.spaces.space_800 * 3,
                width: theme.spaces.space_800 * 2,
              ),
              SizedBox(
                height: theme.spaces.space_300,
              ),
              IntlPhoneField(
                flagsButtonPadding: const EdgeInsets.all(8),
                dropdownIconPosition: IconPosition.trailing,
                showCountryFlag: false,
                decoration: const InputDecoration(
                  fillColor: Colors.grey,
                  filled: true,
                  hintText: 'Phone number',
                  border: OutlineInputBorder(
                    borderSide: BorderSide(),
                  ),
                ),
                initialCountryCode: 'IN',
                onChanged: (phone) {
                  phonenumberController.text = phone.completeNumber;
                },
              ),
              SizedBox(
                height: theme.spaces.space_300,
              ),
              LoginButtonWidget(
                btntxt: 'Send OTP',
                onPressed: () {
                  data.signInWithPhone(context, phonenumberController.text);
                },
              ),
              SizedBox(
                height: theme.spaces.space_300,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'look',
                    style: theme.typography.h400
                        .copyWith(color: theme.colors.textSubtlest),
                  ),
                  LogintxtButtonWidget(
                    txtbtntext: 'login',
                    onPressed: () {
                      context.go(LoginPage.routePath);
                    },
                  ),
                ],
              ),
              SizedBox(
                height: theme.spaces.space_800,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
