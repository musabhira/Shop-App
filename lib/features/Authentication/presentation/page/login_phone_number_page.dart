import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:shopapp/core/themes/app_theme.dart';
import 'package:shopapp/features/Authentication/presentation/page/login_button_widget.dart';
import 'package:shopapp/features/Authentication/presentation/page/login_page.dart';
import 'package:shopapp/features/Authentication/presentation/providers/auth_provider.dart';
import 'package:shopapp/features/Authentication/presentation/widgets/login_text_button_widget.dart';
import 'package:shopapp/features/Authentication/presentation/widgets/phone_number_container_widget.dart';
import 'package:shopapp/features/Authentication/presentation/widgets/text_field_widget.dart';

class LoginPageWithPhone extends ConsumerWidget {
  const LoginPageWithPhone({super.key});
  static const routePath = '/loginwithphone';
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final maindata = ref.read(authProvider.notifier);
    final theme = AppTheme.of(context);

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
              TextfieldWidget(
                  keyboardtype: TextInputType.text,
                  labeltext: 'bhecbx',
                  icondata: Icon(
                    Icons.phone,
                    color: theme.colors.textDisabled,
                  ),
                  controller: maindata.phonenumberlogincontroller),
              SizedBox(
                height: theme.spaces.space_300,
              ),
              LoginButtonWidget(
                btntxt: 'send Otp',
                onPressed: () {
                  maindata.signInWithPhone(
                    context,
                    maindata.phonenumberlogincontroller.text,
                  );
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
