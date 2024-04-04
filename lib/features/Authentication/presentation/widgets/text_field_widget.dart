import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopapp/core/themes/app_theme.dart';

class TextfieldWidget extends ConsumerWidget {
  final String labeltext;
  final Icon icondata;
  final TextEditingController controller;
  final TextInputType keyboardtype;
  const TextfieldWidget(
      {super.key,
      required this.labeltext,
      required this.icondata,
      required this.controller,
      required this.keyboardtype});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width / 1.1,
      child: TextField(
        keyboardType: keyboardtype,
        autofocus: false,
        controller: controller,
        cursorColor: AppTheme.of(context).colors.primary,
        decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(
                vertical: AppTheme.of(context).spaces.space_300,
                horizontal: AppTheme.of(context).spaces.space_400),
            hintText: labeltext,
            prefixIcon: icondata,
            labelStyle: TextStyle(color: AppTheme.of(context).colors.primary),
            fillColor: AppTheme.of(context).colors.textInverse,
            filled: true,
            border: OutlineInputBorder(
                borderSide:
                    BorderSide(color: AppTheme.of(context).colors.primary),
                borderRadius: BorderRadius.circular(10))),
      ),
    );
  }
}
