import 'package:flutter/material.dart';
import 'package:flutter_payment/core/utils/styles.dart';
import 'package:flutter_payment/core/widgets/custom_button.dart';
import 'package:flutter_payment/features/checkout/presentation/views/widgets/card_info_widget.dart';
import 'package:flutter_payment/features/checkout/presentation/views/widgets/payment_info_item.dart';
import 'package:flutter_payment/features/checkout/presentation/views/widgets/total_price_widget.dart';
import 'package:flutter_svg/svg.dart';

class ThankYouCard extends StatelessWidget {
  const ThankYouCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: ShapeDecoration(
        color: const Color(0xFFEDEDED),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(
          top: 26 + 50,
          right: 22,
          left: 22,
        ),
        child: Column(
          children: [
            const Text(
              'Thank you!',
              textAlign: TextAlign.center,
              style: Styles.style25,
            ),
            Text(
              'Your transaction was successful',
              textAlign: TextAlign.center,
              style: Styles.style20,
            ),
            const SizedBox(height: 42),
            const PaymentInfoItem(
              title: 'Date',
              date: '01/24/2023',
            ),
            const SizedBox(height: 20),
            const PaymentInfoItem(
              title: 'Time',
              date: '10:15 AM',
            ),
            const SizedBox(height: 20),
            const PaymentInfoItem(
              title: 'To',
              date: 'Sam Louis',
            ),
            const Divider(
              thickness: 2,
              height: 60,
            ),
            const SizedBox(height: 16),
            const totalPriceWidget(
              title: 'Total',
              value: '\$50.97',
            ),
            const SizedBox(height: 30),
            const CardInfoWidget(),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SvgPicture.asset(
                  'assets/images/iconCarrier.svg',
                ),
                Container(
                  width: 113,
                  height: 58,
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(
                        width: 1.50,
                        color: Color(0xFF34A853),
                      ),
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      'PAID',
                      style: Styles.style24.copyWith(
                        color: const Color(0xff34A853),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height:
                  ((MediaQuery.of(context).size.height * 0.2 + 20) / 2) - 29,
            ),
          ],
        ),
      ),
    );
  }
}
