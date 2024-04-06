import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopapp/core/constants/home_constants/home_constants.dart';
import 'package:shopapp/core/themes/app_theme.dart';

class HorizontalScrollWidget extends ConsumerWidget {
  const HorizontalScrollWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final constants = ref.watch(homeConstantsProvider);
    final theme = AppTheme.of(context);

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: theme.spaces.space_100),
        child: Row(
          children: List.generate(
            5,
            (index) => Padding(
              padding: EdgeInsets.only(left: theme.spaces.space_200),
              child: Column(
                children: [
                  SizedBox(
                    width: 150,
                    height: 150,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network(
                        'https://t4.ftcdn.net/jpg/03/06/99/87/360_F_306998742_5awR6uVsZ8dRNdHHnj0tnm4sGUDBAxQ5.jpg', // Replace with your actual URL structure
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(height: theme.spaces.space_100),
                  Text('${constants.homeCleaningtxt} ${index + 1}',
                      style: theme.typography.h300),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
