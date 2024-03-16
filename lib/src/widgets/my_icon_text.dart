import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:megafood/src/utils/colors.dart';
import 'package:megafood/src/utils/text_style.dart';

class MyIconText extends StatelessWidget {
  final IconData icon;
  final String val;
  final double size;
  const MyIconText({super.key,
  required this.icon,
  required this.val,
  required this.size});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
              Icon(icon,
              color: ThemeColor.c1,
              size: size),
              Gap(2.h),
              Text(val,
              style: MyTextStyle.t13)
            ],);
  }
}