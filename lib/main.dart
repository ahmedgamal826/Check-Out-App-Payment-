import 'package:flutter/material.dart';
import 'package:flutter_payment/core/utils/api_keys.dart';
import 'package:flutter_payment/core/utils/payment_screen.dart';
import 'package:flutter_payment/features/checkout/presentation/views/my_cart_view.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

void main() {
  Stripe.publishableKey = ApiKeys.publishableKey;

  runApp(const CheckOutApp());
}

class CheckOutApp extends StatelessWidget {
  const CheckOutApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: MyCartView(),
      home: MyCartView(),
    );
  }
}

// Steps to save card info payment
// (1) PaymentIntentModel create payment intent
// (amount, currency, customer id)

// (2) Keysecret create Empheralkey(StripeVersion, customer id)

// (3) init payment sheet
//(merchantDisplayName, intent client secret, epheralKey)

// (4) present payment sheet ()
