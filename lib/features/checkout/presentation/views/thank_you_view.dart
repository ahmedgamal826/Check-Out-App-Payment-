import 'package:flutter/material.dart';
import 'package:flutter_payment/core/widgets/custom_appbar.dart';
import 'package:flutter_payment/features/checkout/presentation/views/widgets/thank_you_view_body.dart';

class ThankYouView extends StatelessWidget {
  const ThankYouView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: buildAppbar(context: context),
        body: Transform.translate(
          offset: const Offset(0, -16),
          child: const ThankYouViewBody(),
        ),
      ),
    );
  }
}
