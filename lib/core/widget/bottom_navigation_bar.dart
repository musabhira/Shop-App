import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shopapp/core/themes/app_theme.dart';
import 'package:shopapp/features/home/presentation/page/home_page.dart';
import 'package:shopapp/features/home/presentation/page/profile_page.dart';

class BottomNaviWidget extends HookConsumerWidget {
  static const routePath = '/bottomNav';
  const BottomNaviWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    /// Theme data
    final space = AppTheme.of(context).spaces;
    final theme = AppTheme.of(context);

    final pageController = usePageController();
    final selectedIndex = ref.watch(navbarSelectedPageProvider);
    final navbarIcons = useMemoized(() => [
          Icons.home,
          Icons.shopping_cart,
          Icons.person,
        ]);
    final navbartext = useMemoized(() => [
          'Home',
          'Book',
          'Acct',
        ]);

    // Function to handle page changes in a PageView
    void handlePageChange(int value) {
      pageController.animateToPage(
        value,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    }

    return Scaffold(
      extendBody: true,
      body: PageView(
        controller: pageController,
        onPageChanged: (value) =>
            ref.read(navbarSelectedPageProvider.notifier).state = value,
        children: const [
          HomePage(),
          HomePage(),
          ProfilePage(),
        ],
      ),
      bottomNavigationBar: Card(
        margin: EdgeInsets.only(
          left: space.space_300,
          right: space.space_300,
          bottom: space.space_300,
          top: space.space_100,
        ),
        shape: RoundedRectangleBorder(
          side: BorderSide(color: theme.colors.bottomNavBorder),
          borderRadius: BorderRadius.circular(8),
        ),
        clipBehavior: Clip.antiAlias,
        elevation: 5,
        child: BottomNavigationBar(
          currentIndex: selectedIndex,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          onTap: (value) {
            handlePageChange(value);
          },
          items: [
            for (var i = 0; i < navbarIcons.length; i++)
              BottomNavigationBarItem(
                backgroundColor: theme.colors.textInverse,
                icon: Center(
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 13, vertical: 4),
                    child: Container(
                      height: space.space_600,
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(theme.spaces.space_125),
                        color: selectedIndex == i
                            ? const Color.fromARGB(255, 113, 219, 116)
                                .withOpacity(0.7)
                            : theme.colors.textInverse,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            navbarIcons[i],
                            color: selectedIndex == i
                                ? theme.colors.primary
                                : theme.colors.textSubtle,
                          ),
                          Text(navbartext[i])
                        ],
                      ),
                    ),
                  ),
                ),
                label: '',
              ),
          ],
        ),
      ),
    );
  }
}

final navbarSelectedPageProvider = StateProvider((ref) => 0);
