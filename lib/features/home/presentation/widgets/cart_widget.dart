import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:shopapp/core/constants/home_constants/service_constants.dart';
import 'package:shopapp/core/themes/app_theme.dart';
import 'package:shopapp/features/cart/data/models/cart_model.dart';
import 'package:shopapp/features/cart/presentation/page/cart_page.dart';

class CartWidget extends ConsumerWidget {
  final List<CartModel> cartItems;
  const CartWidget({
    super.key,
    required this.cartItems,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final constants = ref.watch(serviceConstantsProvider);
    final theme = AppTheme.of(context);
    return ClipRRect(
      borderRadius: BorderRadius.circular(24),
      child: Card(
        elevation: 10,
        child: Container(
          height: 100,
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            children: [
              Expanded(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  color: theme.colors.textInverse,
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.all(theme.spaces.space_100),
                      child: Text(
                        '${cartItems.length} items | ₹3355',
                        style: theme.typography.h500,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  color: theme.colors.textSubtlest,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: InkWell(
                      onTap: () {
                        context.push(CartPage.routePath);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Icon(Icons.arrow_right,
                              color: Colors.transparent),
                          Text(
                            constants.viewCarttxt,
                            style: theme.typography.h600
                                .copyWith(color: theme.colors.textInverse),
                          ),
                          Icon(Icons.arrow_right,
                              color: theme.colors.textInverse),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
