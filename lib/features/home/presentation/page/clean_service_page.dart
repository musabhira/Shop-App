import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:shopapp/core/constants/home_constants/service_constants.dart';
import 'package:shopapp/core/themes/app_theme.dart';
import 'package:shopapp/features/cart/presentation/page/cart_page.dart';
import 'package:shopapp/features/home/presentation/widgets/app_bar_widget.dart';
import 'package:shopapp/features/home/presentation/widgets/car_clean_tab_widget.dart';
import 'package:shopapp/features/home/presentation/widgets/deep_clean_tab_bar.dart';
import 'package:shopapp/features/home/presentation/widgets/maid_services_tab_bar_widget.dart';

class CleanServicePage extends ConsumerWidget {
  static const routePath = '/cleansevice';
  const CleanServicePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
            padding: const EdgeInsets.all(16.0),
            child: ClipRRect(
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
                          child: Center(child: Text('2 items | 3355')),
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Icon(Icons.arrow_right,
                                      color: Colors.transparent),
                                  Text(
                                    constants.viewCarttxt,
                                    style: theme.typography.h600.copyWith(
                                        color: theme.colors.textInverse),
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
            ),
          ),
        ));
  }
}
