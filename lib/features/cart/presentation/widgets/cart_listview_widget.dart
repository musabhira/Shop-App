import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopapp/core/themes/app_theme.dart';
import 'package:shopapp/features/cart/data/models/cart_model.dart';
import 'package:shopapp/features/cart/presentation/providers/cart_provider.dart';
import 'package:shopapp/features/home/domain/entites/service_entity.dart';

class CartListviewWidget extends ConsumerWidget {
  final List<ServiceEntity> services;
  final List<CartModel> cartItems;
  const CartListviewWidget(
      {super.key, required this.cartItems, required this.services});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = AppTheme.of(context);
    return ListView.builder(
      shrinkWrap: true,
      itemCount: cartItems.length,
      itemBuilder: (context, index) {
        final cartCount = cartItems
                .where((cartItem) => cartItem.service == services[index].id)
                .firstOrNull
                ?.count ??
            0;

        return Padding(
            padding: EdgeInsets.symmetric(
                horizontal: theme.spaces.space_300,
                vertical: theme.spaces.space_150),
            child: Row(
              children: [
                Text(
                  '${index + 1}.',
                  style: theme.typography.h400,
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    services[index].service,
                    style: theme.typography.h600,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Container(
                  color: theme.colors.textSubtle,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          ref
                              .read(cartProvider.notifier)
                              .deleteCartItem(services[index].id);
                        },
                        child: Container(
                          height: 26,
                          width: 26,
                          color: theme.colors.text,
                          child: Center(
                            child: Icon(
                              Icons.remove,
                              color: theme.colors.textInverse,
                              size: 16,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Text(
                        cartCount.toString(),
                        style: TextStyle(
                          color: theme.colors.primary,
                          fontWeight: FontWeight.w500,
                          fontSize: 15,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(width: 16),
                      InkWell(
                        onTap: () {
                          ref
                              .read(cartProvider.notifier)
                              .addServiceToCart(services[index].id);
                        },
                        child: Container(
                          height: 26,
                          width: 26,
                          color: theme.colors.text,
                          child: Icon(
                            Icons.add,
                            color: theme.colors.textInverse,
                            size: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 16),
                Text(
                  '₹ 124',
                  style: theme.typography.h600,
                )
              ],
            ));
      },
    );
  }
}
