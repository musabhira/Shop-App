import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopapp/core/constants/home_constants/home_constants.dart';
import 'package:shopapp/core/themes/app_theme.dart';

class GreenArrowWidget extends ConsumerWidget {
  const GreenArrowWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = AppTheme.of(context);
    final constants = ref.watch(homeConstantsProvider);
    return Column(
      children: [
        Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: theme.colors.textSubtle,
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Icon(
              Icons.arrow_forward,
              color: theme.colors.primary,
            ),
          ),
        ),
        const SizedBox(height: 5),
        Text(
          constants.seeAlltxt,
          style: TextStyle(color: theme.colors.primary),
        ),
      ],
    );
  }
}
