import 'package:flutter/material.dart';
import 'package:shopapp/core/themes/app_theme.dart';

class CouponCodeWidget extends StatelessWidget {
  const CouponCodeWidget({super.key});
  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: theme.spaces.space_200),
        child: SizedBox(
          // height:
          child: Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(theme.spaces.space_100),
                side: BorderSide(color: theme.colors.textDisabled)),
            elevation: 2,
            borderOnForeground: true,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 196, 196, 196),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(theme.spaces.space_100))),
                  height: 40,
                  width: 130,
                  child: Center(
                    child: Text(
                      'Coupon Code',
                      style: theme.typography.h400
                          .copyWith(color: theme.colors.text),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: theme.spaces.space_200,
                      vertical: theme.spaces.space_200),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft:
                                    Radius.circular(theme.spaces.space_100),
                                bottomLeft:
                                    Radius.circular(theme.spaces.space_100)),
                            border: Border.all(
                                color: theme.colors.textDisabled, width: 1),
                          ),
                          child: TextField(
                            decoration: InputDecoration(
                              contentPadding:
                                  EdgeInsets.all(theme.spaces.space_100),
                              hintText: 'Enter Coupon Code',
                              hintStyle: TextStyle(
                                  color: theme.colors.textDisabled,
                                  fontSize: 12),
                              border: InputBorder.none,
                              fillColor: Colors.transparent,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: 80,
                        height: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topRight:
                                    Radius.circular(theme.spaces.space_100),
                                bottomRight:
                                    Radius.circular(theme.spaces.space_100)),
                            gradient: theme.colors.secondary),
                        child: Center(
                            child: Text(
                          'Apply',
                          style: theme.typography.h300
                              .copyWith(color: theme.colors.textInverse),
                        )),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
