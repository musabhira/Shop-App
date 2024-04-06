import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shopapp/core/themes/app_theme.dart';
import 'package:shopapp/features/Authentication/presentation/page/login_button_widget.dart';
import 'package:shopapp/features/Authentication/presentation/providers/auth_provider.dart';
import 'package:shopapp/features/Authentication/presentation/widgets/phone_number_container_widget.dart';
import 'package:shopapp/features/Authentication/presentation/widgets/text_field_widget.dart';

class OtpVerificationPage extends HookConsumerWidget {
  const OtpVerificationPage({super.key});
  static const routePath = '/loginwithotp';
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = AppTheme.of(context);
    final data = ref.read(authProvider.notifier);
    final otpController = useTextEditingController();

    return Scaffold(
      backgroundColor: theme.colors.textInverse,
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
              Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: theme.spaces.space_200),
                child: TextfieldWidget(
                  keyboardtype: TextInputType.number,
                  hintText: 'Enter Otp',
                  icondata: const Icon(Icons.lock_clock_rounded),
                  controller: otpController,
                ),
              ),
              SizedBox(
                height: theme.spaces.space_300,
              ),
              LoginButtonWidget(
                btntxt: 'Confirm Otp',
                onPressed: () {
                  data.verifyOtp(context, otpController.text, ref);
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
