import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/themes/app_theme.dart';

class TextWithArrowWidget extends ConsumerWidget {
  final String leftText;
  final String rightText;
  final IconData icon;

  const TextWithArrowWidget({
    super.key,
    required this.leftText,
    required this.rightText,
    required this.icon,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = AppTheme.of(context);

    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: theme.spaces.space_300, vertical: theme.spaces.space_300),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            leftText,
            style: theme.typography.h700,
          ),
          Row(
            children: [
              Text(
                rightText,
                style: TextStyle(color: theme.colors.primary),
              ),
              SizedBox(
                width: theme.spaces.space_100,
              ),
              Icon(
                icon,
                size: theme.spaces.space_200,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
