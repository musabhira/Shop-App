import 'package:flutter/material.dart';
import 'package:shopapp/core/themes/app_theme.dart';
import 'package:shopapp/features/home/presentation/widgets/app_bar_widget.dart';

class CartPage extends StatelessWidget {
  static const routePath = '/cart';
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    // final constants = ref.watch(homeConstantsProvider);
    final theme = AppTheme.of(context);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(theme.spaces.space_700),
        child: const AppBarWidget(
          text: 'cart',
        ),
      ),
    );
  }
}
