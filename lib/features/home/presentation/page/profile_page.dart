import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopapp/core/constants/home_constants/profile_constants.dart';

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
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius:
                      BorderRadius.all(Radius.circular(theme.spaces.space_100)),
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
            padding: EdgeInsets.symmetric(horizontal: theme.spaces.space_300),
            child: Container(
              color: theme.colors.bottomNavBorder.withOpacity(0.3),
              child: Row(
                children: [
                  Text(
                    constants.wallettxt,
                    style: theme.typography.h500
                        .copyWith(color: theme.colors.primary),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
