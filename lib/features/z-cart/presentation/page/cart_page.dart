import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shopapp/core/constants/cart_constant/cart_constant.dart';
import 'package:shopapp/core/themes/app_theme.dart';
import 'package:shopapp/features/home/presentation/providers/service_provider.dart';
import 'package:shopapp/features/home/presentation/widgets/app_bar_widget.dart';
import 'package:shopapp/features/home/presentation/widgets/book_solt_widget.dart';
import 'package:shopapp/features/home/presentation/widgets/loading_widget.dart';
import 'package:shopapp/features/z-cart/presentation/providers/cart_provider.dart';
import 'package:shopapp/features/z-cart/presentation/widgets/bill_details_widget.dart';
import 'package:shopapp/features/z-cart/presentation/widgets/cart_listview_widget.dart';
import 'package:shopapp/features/z-cart/presentation/widgets/coupon_code_widget.dart';

class CartPage extends ConsumerWidget {
  static const routePath = '/cart';
  const CartPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final contants = ref.watch(cartConstantsProvider);
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

    const Widget loading = Center(
        child: LoadingCategoryWidget(
      entity: [],
    ));

    Widget? contentToShow;
    ref.watch(getServiceProvider).when(
          data: (services) {
            ref.watch(getCartProvider).when(
                  data: (cart) => contentToShow = CartListviewWidget(
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

    final theme = AppTheme.of(context);
    return Scaffold(
      // extendBody: true,
      backgroundColor: theme.colors.textSubtle,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(theme.spaces.space_700),
        child: const AppBarWidget(
          text: 'cart',
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(child: contentToShow),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: theme.spaces.space_300,
                  vertical: theme.spaces.space_100),
              child: Text(
                contants.addMoretxt,
                style:
                    theme.typography.h500.copyWith(color: theme.colors.primary),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: theme.spaces.space_300,
                  vertical: theme.spaces.space_100),
              child: Text(
                contants.frequentlytxt,
                style: theme.typography.h600.copyWith(color: theme.colors.text),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: theme.spaces.space_150),
              child: SizedBox(
                height: 230,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 6,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.all(theme.spaces.space_100),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(theme.spaces.space_100),
                          color: theme.colors.textInverse,
                        ),
                        child: Column(
                          children: [
                            SizedBox(
                              width: 150,
                              height: 150,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(
                                    theme.spaces.space_100),
                                child: Image.network(
                                  'https://plus.unsplash.com/premium_photo-1678304223767-b9aa73c1e147?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTN8fGNsZWFuaW5nfGVufDB8fDB8fHww',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'Bathroom cleaning',
                              style: theme.typography.h200
                                  .copyWith(color: theme.colors.text),
                            ),
                            SizedBox(
                              height: theme.spaces.space_100,
                            ),
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 70),
                                  child: Text(
                                    '₹500',
                                    style: theme.typography.h300
                                        .copyWith(color: theme.colors.text),
                                  ),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      gradient: theme.colors.secondary),
                                  child: Icon(
                                    Icons.add,
                                    size: 20,
                                    color: theme.colors.textInverse,
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            SizedBox(
              height: theme.spaces.space_100,
            ),
            const CouponCodeWidget(),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: theme.spaces.space_300,
                  vertical: theme.spaces.space_200),
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: theme.colors.secondary),
                    child: Padding(
                      padding: const EdgeInsets.all(3),
                      child: Center(
                        child: Icon(
                          Icons.check,
                          color: theme.colors.textInverse,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: theme.spaces.space_300),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Your Wallet balance is ₹125',
                          style: theme.typography.h100
                              .copyWith(color: theme.colors.text),
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          'in the order',
                          style: theme.typography.h100
                              .copyWith(color: theme.colors.text),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            const BillDetailsWidget()
          ],
        ),
      ),
      bottomNavigationBar: Padding(
          padding: EdgeInsets.all(theme.spaces.space_200),
          child: const BookSoltWidget()),
    );
  }
}
