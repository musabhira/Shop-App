import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopapp/core/themes/app_theme.dart';

class LogintxtButtonWidget extends ConsumerWidget {
  final String txtbtntext;
  final void Function()? onPressed;

  const LogintxtButtonWidget(
      {super.key, required this.txtbtntext, required this.onPressed});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = AppTheme.of(context);
    return TextButton(
      onPressed: onPressed,
      child: Text(
        txtbtntext,
        style: theme.typography.h400.copyWith(color: theme.colors.primary),
      ),
    );
  }
}
