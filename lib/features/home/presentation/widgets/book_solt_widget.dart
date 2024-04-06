import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shopapp/core/constants/cart_constant/cart_constant.dart';

import 'package:shopapp/core/themes/app_theme.dart';

class BookSoltWidget extends ConsumerWidget {
  const BookSoltWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final constants = ref.watch(cartConstantsProvider);
    final theme = AppTheme.of(context);
    return ClipRRect(
      borderRadius: BorderRadius.circular(24),
      child: Card(
        elevation: 10,
        child: Container(
          height: 100,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              gradient: theme.colors.secondary),
          child: Column(
            children: [
              Expanded(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  color: theme.colors.textInverse,
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.all(theme.spaces.space_100),
                      child: Text(
                        'Grand Total | ₹3355',
                        style: theme.typography.h500,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      gradient: theme.colors.secondary),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: InkWell(
                      onTap: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Icon(Icons.arrow_right,
                              color: Colors.transparent),
                          Text(
                            constants.bookSlottxt,
                            style: theme.typography.h600
                                .copyWith(color: theme.colors.textInverse),
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
    );
  }
}
