import 'package:flutter/material.dart';
import 'package:shopapp/core/themes/app_theme.dart';

class BillItemWidget extends StatelessWidget {
  final String txt;
  final String txtPrice;
  const BillItemWidget({super.key, required this.txt, required this.txtPrice});

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: theme.spaces.space_300, vertical: theme.spaces.space_100),
      child: Row(
        children: [
          Text(
            txt,
            style: theme.typography.h100.copyWith(
              color: theme.colors.text,
            ),
          ),
          const Spacer(),
          Text(
            txtPrice,
            style: theme.typography.h100.copyWith(
              color: theme.colors.text,
            ),
          )
        ],
      ),
    );
  }
}
