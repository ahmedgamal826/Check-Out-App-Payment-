import 'package:flutter/material.dart';
import 'package:flutter_payment/core/widgets/custom_button.dart';
import 'package:flutter_payment/features/checkout/presentation/views/payment_details_view.dart';
import 'package:flutter_payment/features/checkout/presentation/views/widgets/order_info_item.dart';
import 'package:flutter_payment/features/checkout/presentation/views/widgets/payment_methods_list_view.dart';
import 'package:flutter_payment/features/checkout/presentation/views/widgets/total_price_widget.dart';

class MyCartViewBody extends StatelessWidget {
  const MyCartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          const SizedBox(height: 25),
          Expanded(
            child: Image.asset(
              'assets/images/basket.png',
            ),
          ),
          const SizedBox(height: 25),
          const OrderInfoItem(
            title: 'Order Subtotal',
            value: '\$42.97',
          ),
          const SizedBox(height: 3),
          const OrderInfoItem(
            title: 'Discount',
            value: '\$0',
          ),
          const SizedBox(height: 3),
          const OrderInfoItem(
            title: 'Shipping',
            value: '\$8',
          ),
          // const SizedBox(height: 17),
          const Divider(
            height: 34,
            indent: 35,
            endIndent: 35,
            thickness: 2,
            color: Color(0xFFC6C6C6),
          ),
          const totalPriceWidget(
            title: 'Total',
            value: '\$50.97',
          ),

          const SizedBox(height: 16),

          CustomButton(
            title: 'Complete Payment',
            onTap: () {
              // Navigator.push(context, MaterialPageRoute(builder: (context) {
              //   return const PaymentDetailsView();
              // }));

              showModalBottomSheet(
                context: context,
                isScrollControlled: true, // يتيح التحكم في الارتفاع
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                ),
                builder: (context) {
                  return const PaymentMethodsBottomSheet();
                },
              );
            },
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}

class PaymentMethodsBottomSheet extends StatelessWidget {
  const PaymentMethodsBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 16),
          const PaymentMethodsListView(),
          const SizedBox(height: 32),
          CustomButton(
            title: 'Continue',
            onTap: () {},
          )
        ],
      ),
    );
  }
}
