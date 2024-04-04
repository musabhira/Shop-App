import 'package:flutter/material.dart';
import 'package:shopapp/core/themes/app_theme.dart';

class SettingWidget extends StatelessWidget {
  final String txt;
  final IconData icon;
  const SettingWidget({super.key, required this.txt, required this.icon});

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: theme.spaces.space_300, vertical: theme.spaces.space_100),
      child: Container(
        padding: EdgeInsets.all(theme.spaces.space_100),
        decoration: BoxDecoration(
          border: Border.all(
            color: theme.colors.textSubtle,
            width: 1.0,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(7.0),
              child: Icon(
                icon,
                size: theme.spaces.space_300,
                color: theme.colors.textSubtle,
              ),
            ),
            SizedBox(width: theme.spaces.space_300),
            Expanded(
              child: Text(
                txt,
                style: theme.typography.h500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
