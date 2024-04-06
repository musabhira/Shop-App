import 'package:flutter/material.dart';
import 'package:shopapp/core/themes/app_theme.dart';
import 'package:shopapp/features/z-cart/presentation/widgets/bill_item_widget.dart';
import 'package:shopapp/features/z-cart/presentation/widgets/total_bill_widget.dart';
import 'package:dotted_line/dotted_line.dart';

class BillDetailsWidget extends StatelessWidget {
  const BillDetailsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: theme.spaces.space_200),
        child: SizedBox(
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
                      color: const Color.fromARGB(255, 196, 196, 196),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(theme.spaces.space_100))),
                  height: theme.spaces.space_100 * 5,
                  width: theme.spaces.space_100 * 16.25,
                  child: Center(
                    child: Text(
                      'Coupon Code',
                      style: theme.typography.h400
                          .copyWith(color: theme.colors.text),
                    ),
                  ),
                ),
                const BillItemWidget(
                    txt: 'kitchen Cleaning', txtPrice: '\$499'),
                const BillItemWidget(txt: 'Fan Cleaning', txtPrice: '\$499'),
                const BillItemWidget(txt: 'Taxes and Fees', txtPrice: '\$50'),
                const BillItemWidget(txt: 'Taxes and Fees', txtPrice: '-150 X'),
                SizedBox(
                  height: theme.spaces.space_100,
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: theme.spaces.space_200),
                  child: const DottedLine(),
                ),
                const TotalBillWidget(txt: 'Total', txtPrice: '\$499')
              ],
            ),
          ),
        ),
      ),
    );
  }
}
