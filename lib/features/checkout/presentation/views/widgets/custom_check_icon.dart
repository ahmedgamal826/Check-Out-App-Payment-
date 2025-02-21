import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomCheckIcon extends StatelessWidget {
  const CustomCheckIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: const Color(0xFFD9D9D9),
      radius: 50,
      child: CircleAvatar(
        backgroundColor: Colors.green,
        radius: 40,
        child: SvgPicture.asset(
          'assets/images/check.svg',
        ),
      ),
    );
  }
}
