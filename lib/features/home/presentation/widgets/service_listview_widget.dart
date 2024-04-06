import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shopapp/features/z-cart/data/models/cart_model.dart';
import 'package:shopapp/features/z-cart/presentation/providers/cart_provider.dart';
import 'package:shopapp/features/home/domain/entites/service_entity.dart';

import '../../../../core/themes/app_theme.dart';

class ServiceListviewWidget extends HookConsumerWidget {
  final List<ServiceEntity> services;
  final List<CartModel> cartItems;

  const ServiceListviewWidget({
    super.key,
    required this.services,
    required this.cartItems,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = AppTheme.of(context);

    return ListView.builder(
      itemCount: services.length,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        final cartCount = cartItems
                .where((cartItem) => cartItem.service == services[index].id)
                .firstOrNull
                ?.count ??
            0;

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 10),
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white,
                ),
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          left: theme.spaces.space_200,
                          right: 15,
                          top: theme.spaces.space_100,
                          bottom: theme.spaces.space_100),
                      child: Container(
                        height: MediaQuery.sizeOf(context).height / 9,
                        width: MediaQuery.sizeOf(context).width / 4.20,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: const DecorationImage(
                                image: NetworkImage(
                                    "https://www.homecaresolutions.in/assets/images/newimage/Get%20A%20Deep%20Clean.jpg"),
                                fit: BoxFit.cover)),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: theme.spaces.space_100),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ///Row 1
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const Icon(
                                Icons.star,
                                size: 17,
                                color: Colors.amber,
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    left: theme.spaces.space_100),
                                child: Text(
                                  "(4.2/5) 23 orders",
                                  style: theme.typography.h200.copyWith(
                                      color: theme.colors.textDisabled),
                                ),
                              ),
                            ],
                          ),
                          Text(
                            services[index].service,
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w500),
                          ),
                          const Text(
                            "60 Minutes",
                            style: TextStyle(color: Colors.grey),
                          ),
                          Text(
                            "₹ ${services[index].price.toDouble()}",
                            style: theme.typography.h700,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                right: 0,
                bottom: 0,
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () {
                      ref
                          .read(cartProvider.notifier)
                          .addServiceToCart(services[index].id);
                    },
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(15),
                      bottomRight: Radius.circular(15),
                    ),
                    child: Ink(
                        height: MediaQuery.of(context).size.height / 23,
                        width: MediaQuery.of(context).size.width / 3.1,
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(15),
                            bottomRight: Radius.circular(15),
                          ),
                          gradient:
                              cartCount < 1 ? theme.colors.secondary : null,
                          color: cartCount >= 1
                              ? const Color.fromARGB(255, 219, 221, 223)
                              : null,
                        ),
                        child: cartCount < 1
                            ? Center(
                                child: Text(
                                    cartCount < 1
                                        ? "Add +"
                                        : cartCount.toString(),
                                    style: cartCount < 1
                                        ? TextStyle(
                                            color: theme.colors.textInverse,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 15,
                                          )
                                        : TextStyle(
                                            color: theme.colors.primary,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 15,
                                          )),
                              )
                            : Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  IconButton(
                                    icon: Icon(
                                      Icons.remove,
                                      size: theme.spaces.space_200,
                                    ),
                                    onPressed: () {
                                      ref
                                          .read(cartProvider.notifier)
                                          .deleteCartItem(services[index].id);
                                    },
                                  ),
                                  Text(
                                    cartCount < 1
                                        ? "Add +"
                                        : cartCount.toString(),
                                    style: cartCount < 1
                                        ? TextStyle(
                                            color: theme.colors.textInverse,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 15,
                                          )
                                        : TextStyle(
                                            color: theme.colors.primary,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 15,
                                          ),
                                    textAlign: TextAlign.center,
                                  ),
                                  IconButton(
                                    icon: Icon(
                                      Icons.add,
                                      size: theme.spaces.space_200,
                                    ),
                                    onPressed: () {
                                      ref
                                          .read(cartProvider.notifier)
                                          .addServiceToCart(services[index].id);
                                    },
                                  ),
                                ],
                              )),
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
