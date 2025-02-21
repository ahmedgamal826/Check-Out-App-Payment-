import 'package:flutter/material.dart';
import 'package:flutter_payment/core/widgets/custom_appbar.dart';
import 'package:flutter_payment/features/checkout/presentation/views/widgets/payment_details_body.dart';

class PaymentDetailsView extends StatelessWidget {
  const PaymentDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppbar(title: 'Payment Details'),
      body: const PaymentDetailsViewBody(),
    );
  }
}
