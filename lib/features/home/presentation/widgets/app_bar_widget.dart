import 'package:flutter/material.dart';
import 'package:shopapp/core/themes/app_theme.dart';

class AppBarWidget extends StatelessWidget {
  final String text;
  const AppBarWidget({super.key, required this.text});
  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    return Container(
      height: MediaQuery.sizeOf(context).height / 8,
      width: MediaQuery.sizeOf(context).width,
      color: theme.colors.textSubtle,
      child: Padding(
        padding: const EdgeInsets.only(top: 30, left: 22),
        child: Row(
          children: [
            Container(
              height: MediaQuery.sizeOf(context).height / 25,
              width: MediaQuery.sizeOf(context).width / 12,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: theme.colors.textDisabled,
              ),
              child: const Icon(Icons.keyboard_arrow_left_outlined),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Text(
                text,
                style: AppTheme.of(context).typography.h500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
