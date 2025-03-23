import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:megafood/src/utils/text_style.dart';

class IconTextRow extends StatelessWidget {
  final Color color;
  final IconData icon;
  final String text;
  const IconTextRow({super.key,
  required this.color,
  required this.icon,
  required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
         Icon(
          icon,
          color:color,
          size: 26.sp),
        Gap(20.w),
        Text(text,
          style: MyTextStyle.t22),
      ],
    );
  }
}