import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shopapp/features/cart/presentation/providers/cart_provider.dart';
import 'package:shopapp/features/home/presentation/providers/service_provider.dart';
import 'package:shopapp/features/home/presentation/widgets/loading_widget.dart';
import 'package:shopapp/features/home/presentation/widgets/service_listview_widget.dart';

class MaidServicesTapbarWidget extends ConsumerWidget {
  const MaidServicesTapbarWidget({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Widget error = Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Cannot fetch services'),
          IconButton(
            onPressed: () {
              ref.invalidate(getServiceProvider);
            },
            icon: const Icon(Icons.refresh),
          )
        ],
      ),
    );

    const Widget loading = Center(
        child: LoadingCategoryWidget(
      entity: [],
    ));

    Widget? contentToShow;
    ref.watch(getServiceProvider).when(
          data: (services) {
            ref.watch(getCartProvider).when(
                  data: (cart) => contentToShow = ServiceListviewWidget(
                    services: services,
                    cartItems: cart,
                  ),
                  error: (e, s) => contentToShow = error,
                  loading: () => contentToShow = loading,
                );
          },
          error: (e, s) => contentToShow = error,
          loading: () => contentToShow = loading,
        );

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 240, 237, 237),
      body: contentToShow,
    );
  }
}
