import 'package:flutter/material.dart';
import 'package:flutter_payment/core/widgets/custom_button.dart';
import 'package:flutter_payment/features/checkout/presentation/views/widgets/custom_button_consumer.dart';
import 'package:flutter_payment/features/checkout/presentation/views/widgets/payment_methods_list_view.dart';

class PaymentMethodsBottomSheet extends StatefulWidget {
  const PaymentMethodsBottomSheet({super.key});

  @override
  State<PaymentMethodsBottomSheet> createState() =>
      _PaymentMethodsBottomSheetState();
}

class _PaymentMethodsBottomSheetState extends State<PaymentMethodsBottomSheet> {
  String selectedPaymentMethod = "Credit";

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 16),
          PaymentMethodsListView(
            onPaymentMethodSelected: (method) {
              setState(() {
                selectedPaymentMethod = method;
              });
            },
          ),
          const SizedBox(height: 32),
          CustomButtonConsumer(
            selectedPaymentMethod: selectedPaymentMethod,
          )
        ],
      ),
    );
  }
}
