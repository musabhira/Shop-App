import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopapp/core/themes/app_theme.dart';
import 'package:shopapp/features/Authentication/presentation/page/login_button_widget.dart';
import 'package:shopapp/features/Authentication/presentation/providers/auth_provider.dart';
import 'package:shopapp/features/Authentication/presentation/widgets/phone_number_container_widget.dart';
import 'package:shopapp/features/Authentication/presentation/widgets/text_field_widget.dart';

class OtpVerificationPage extends ConsumerWidget {
  const OtpVerificationPage({super.key});
  static const routePath = '/loginwithotp';
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final maindata = ref.read(authProvider.notifier);
    final theme = AppTheme.of(context);
    // final data = ref.watch(loginConstantsProvider);

    return Scaffold(
      backgroundColor: theme.colors.textDisabled,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              LoginContainerWidget(
                image: 'jnj',
                height: theme.spaces.space_800 * 3,
                width: theme.spaces.space_800 * 2,
              ),
              SizedBox(
                height: theme.spaces.space_300,
              ),
              TextfieldWidget(
                  keyboardtype: TextInputType.number,
                  labeltext: 'otppp',
                  icondata: const Icon(Icons.lock_clock_rounded),
                  controller: maindata.otpcontroller),
              SizedBox(
                height: theme.spaces.space_300,
              ),
              LoginButtonWidget(
                btntxt: 'otp conform',
                onPressed: () {
                  maindata.verifyOtp(
                    context,
                    maindata.otpcontroller.text,
                  );
                },
              ),
              SizedBox(
                height: theme.spaces.space_800 * 2,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
