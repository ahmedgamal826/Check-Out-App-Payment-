import 'package:flutter/material.dart';
import 'package:flutter_payment/features/checkout/presentation/views/widgets/payment_method_item.dart';

class PaymentMethodsListView extends StatefulWidget {
  const PaymentMethodsListView({
    required this.onPaymentMethodSelected,
    super.key,
  });

  final ValueChanged<String> onPaymentMethodSelected; // Callback function

  @override
  State<PaymentMethodsListView> createState() => _PaymentMethodsListViewState();
}

class _PaymentMethodsListViewState extends State<PaymentMethodsListView> {
  int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    List<String> paymentMethods = [
      'assets/images/card.svg',
      'assets/images/paypal.svg',
    ];
    final List<String> paymentMethodNames = ["Credit", "PayPal"];

    return SizedBox(
      height: 62,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: paymentMethods.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  activeIndex = index;
                });
                widget.onPaymentMethodSelected(paymentMethodNames[index]);
              },
              child: PaymentMethodItem(
                isActive: activeIndex == index,
                image: paymentMethods[index],
              ),
            ),
          );
        },
      ),
    );
  }
}
