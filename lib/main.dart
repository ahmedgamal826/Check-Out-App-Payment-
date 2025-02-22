import 'package:flutter/material.dart';
import 'package:flutter_payment/features/checkout/presentation/views/my_cart_view.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

void main() {
  Stripe.publishableKey =
      "pk_test_51Qv4oXHKkhqPwua69drPfrFGF2yszZq09Hw3115EUHukdu8EbShIVHFG4a1Oa2Azd2ZpOPPVU4WisCF2nkP2DOip00Pj7Ziy6c";

  runApp(const CheckOutApp());
}

class CheckOutApp extends StatelessWidget {
  const CheckOutApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyCartView(),
    );
  }
}
