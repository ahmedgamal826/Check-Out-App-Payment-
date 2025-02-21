import 'package:flutter/material.dart';
import 'package:flutter_payment/core/utils/styles.dart';

class totalPriceWidget extends StatelessWidget {
  const totalPriceWidget({
    super.key,
    required this.title,
    required this.value,
  });

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: Styles.style24,
        ),
        const Spacer(),
        Text(
          value,
          style: Styles.style24,
        )
      ],
    );
  }
}
