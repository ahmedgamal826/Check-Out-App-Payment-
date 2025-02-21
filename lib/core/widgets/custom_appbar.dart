import 'package:flutter/material.dart';
import 'package:flutter_payment/core/utils/styles.dart';
import 'package:flutter_svg/svg.dart';

AppBar buildAppbar({String? title}) {
  return AppBar(
    leading: Center(
      child: SvgPicture.asset(
        'assets/images/arrow.svg',
      ),
    ),
    elevation: 0,
    centerTitle: true,
    backgroundColor: Colors.transparent,
    title: Text(
      textAlign: TextAlign.center,
      title ?? '',
      style: Styles.style25,
    ),
  );
}
