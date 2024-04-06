import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopapp/core/constants/home_constants/profile_constants.dart';
import 'package:shopapp/features/Authentication/presentation/providers/auth_provider.dart';
import 'package:shopapp/features/home/presentation/widgets/setting_widget.dart';

import '../../../../core/themes/app_theme.dart';

class ProfilePage extends ConsumerWidget {
  static const routePath = '/profile';
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final constants = ref.watch(profileConstantsProvider);
    final theme = AppTheme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: EdgeInsets.symmetric(horizontal: theme.spaces.space_100),
          child: Text(
            constants.myAccounttxt,
            style: theme.typography.h700,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.all(
                        Radius.circular(theme.spaces.space_100)),
                    child: SizedBox(
                      height: 55,
                      child: Image.network(
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQESgEgkgFa6JBZxS_lIO7glUy3SWRmbfO4K7sTq6_1NA&s'),
                    ),
                  ),
                  const SizedBox(
                    width: 24,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        constants.fathimatxt,
                        style: theme.typography.h800,
                      ),
                      Text(
                        constants.numbertxt,
                        style: theme.typography.h100,
                      ),
                    ],
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: theme.spaces.space_300,
                  vertical: theme.spaces.space_200),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(theme.spaces.space_100),
                child: Container(
                  height: 50,
                  color: theme.colors.bottomNavBorder.withOpacity(0.3),
                  child: Row(
                    children: [
                      SizedBox(
                        width: theme.spaces.space_150,
                      ),
                      Text(
                        constants.wallettxt,
                        style: theme.typography.h600
                            .copyWith(color: theme.colors.primary),
                      ),
                      const Spacer(),
                      Container(
                        color: theme.colors.textInverse,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: theme.spaces.space_200, vertical: 4),
                          child: Text(constants.balancetxt,
                              style: theme.typography.h600
                                  .copyWith(color: theme.colors.primary)),
                        ),
                      ),
                      SizedBox(
                        width: theme.spaces.space_200,
                      )
                    ],
                  ),
                ),
              ),
            ),
            SettingWidget(
                txt: constants.editprofiletxt, icon: Icons.account_circle),
            SettingWidget(
                txt: constants.savedAddresstxt, icon: Icons.location_on),
            SettingWidget(
                txt: constants.termsConditiontxt,
                icon: Icons.book_online_outlined),
            SettingWidget(
                txt: constants.privacyPolicytxt,
                icon: Icons.book_online_outlined),
            SettingWidget(
                txt: constants.referAFriendtxt,
                icon: Icons.people_alt_outlined),
            SettingWidget(txt: constants.customerSupporttxt, icon: Icons.call),
            SettingWidget(
              onTap: () {
                ref.read(authProvider.notifier).signOut(context);
              },
              txt: constants.logOuttxt,
              icon: Icons.logout,
            ),
            const SizedBox(
              height: 200,
            )
          ],
        ),
      ),
    );
  }
}
