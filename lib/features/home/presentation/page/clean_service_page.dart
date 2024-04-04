import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopapp/core/constants/home_constants/service_constants.dart';
import 'package:shopapp/core/themes/app_theme.dart';
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
        backgroundColor: theme.colors.textInverse,
        body: Column(
          children: [
            AppBarWidget(text: constants.cleanServicetxt),
            Container(
              decoration: BoxDecoration(
                  color: theme.colors.bottomNavBorder.withOpacity(0.4)),
              child: TabBar(
                indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
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
      ),
    );
  }
}
                    // indicatorColor: context.colors.primary,
                    // indicatorSize: TabBarIndicatorSize.tab,
                    // indicatorPadding: EdgeInsets.symmetric(
                    //     horizontal: context.spaces.space_300),
                    // labelColor: context.colors.primary,
                    // unselectedLabelColor: context.colors.text,
                    // labelStyle: context.typography.h700,
