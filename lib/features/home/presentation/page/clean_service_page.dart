import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopapp/core/constants/home_constants/service_constants.dart';
import 'package:shopapp/core/themes/app_theme.dart';
import 'package:shopapp/features/cart/data/models/cart_model.dart';
import 'package:shopapp/features/cart/presentation/providers/cart_provider.dart';
import 'package:shopapp/features/home/presentation/providers/service_provider.dart';
import 'package:shopapp/features/home/presentation/widgets/app_bar_widget.dart';
import 'package:shopapp/features/home/presentation/widgets/car_clean_tab_widget.dart';
import 'package:shopapp/features/home/presentation/widgets/cart_widget.dart';
import 'package:shopapp/features/home/presentation/widgets/deep_clean_tab_bar.dart';
import 'package:shopapp/features/home/presentation/widgets/maid_services_tab_bar_widget.dart';

class CleanServicePage extends ConsumerWidget {
  static const routePath = '/cleansevice';
  const CleanServicePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Widget error = Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Cannot fetch services'),
          // Text(''),
          IconButton(
            onPressed: () {
              ref.invalidate(getServiceProvider);
            },
            icon: const Icon(Icons.refresh),
          )
        ],
      ),
    );

    const Widget loading = Center(child: CircularProgressIndicator());

    Widget? contentToShow;
    ref.watch(getServiceProvider).when(
          data: (services) {
            ref.watch(getCartProvider).when(
                  data: (cart) => contentToShow = CartWidget(
                    cartItems: cart,
                  ),
                  error: (e, s) => contentToShow = error,
                  loading: () => contentToShow = loading,
                );
          },
          error: (e, s) => contentToShow = error,
          loading: () => contentToShow = loading,
        );

    final constants = ref.watch(serviceConstantsProvider);
    final theme = AppTheme.of(context);
    return DefaultTabController(
        length: 3,
        initialIndex: 1,
        child: Scaffold(
          extendBody: true,
          backgroundColor: theme.colors.textSubtle,
          body: Column(
            children: [
              AppBarWidget(
                text: constants.cleanServicetxt,
              ),
              Container(
                decoration: BoxDecoration(
                    color: theme.colors.bottomNavBorder.withOpacity(0.4)),
                child: TabBar(
                  indicator: BoxDecoration(
                      borderRadius:
                          BorderRadius.circular(theme.spaces.space_100),
                      gradient: theme.colors.secondary),
                  indicatorSize: TabBarIndicatorSize.tab,
                  indicatorPadding: const EdgeInsets.symmetric(vertical: 7),
                  labelColor: theme.colors.textInverse,
                  unselectedLabelColor: theme.colors.text,
                  tabs: [
                    Tab(
                      text: constants.deepCleaningtxt,
                    ),
                    Tab(
                      text: constants.maidServicetxt,
                    ),
                    Tab(
                      text: constants.carcleaningtxt,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.sizeOf(context).height / 1.300,
                width: MediaQuery.sizeOf(context).width,
                child: const TabBarView(children: [
                  DeepCleaningTapbarWidget(),
                  MaidServicesTapbarWidget(),
                  CarCleaningTapbarWidget()
                ]),
              )
            ],
          ),
          bottomNavigationBar: Padding(
              padding: const EdgeInsets.all(16.0), child: contentToShow),
        ));
  }
}

final cartItemsProvider = Provider<List<CartModel>>((ref) {
  return [];
});

final cartItemsLengthProvider = Provider<int>((ref) {
  return ref.watch(cartItemsProvider).length;
});
