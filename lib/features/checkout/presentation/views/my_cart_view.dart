import 'package:flutter/material.dart';
import 'package:flutter_payment/core/widgets/custom_appbar.dart';
import 'package:flutter_payment/features/checkout/presentation/views/widgets/my_cart_view_body.dart';

class MyCartView extends StatelessWidget {
  const MyCartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppbar(title: 'My Cart', context: context),
      body: const MyCartViewBody(),
    );
  }
}
