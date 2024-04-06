import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopapp/core/themes/app_theme.dart';

class TextfieldWidget extends ConsumerWidget {
  final String hintText;
  final Icon icondata;
  final TextEditingController controller;
  final TextInputType keyboardtype;
  const TextfieldWidget(
      {super.key,
      required this.hintText,
      required this.icondata,
      required this.controller,
      required this.keyboardtype});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = AppTheme.of(context);
    return SizedBox(
      child: TextField(
        keyboardType: keyboardtype,
        autofocus: false,
        controller: controller,
        cursorColor: theme.colors.text,
        decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(vertical: 24),
            hintText: hintText,
            prefixIcon: icondata,
            iconColor: theme.colors.text,
            hintStyle: TextStyle(color: theme.colors.text),
            fillColor: Colors.transparent,
            filled: true,
            border: OutlineInputBorder(
                borderSide: BorderSide(color: theme.colors.text),
                borderRadius: BorderRadius.circular(10))),
      ),
    );
  }
}
