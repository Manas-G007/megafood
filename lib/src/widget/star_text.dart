import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:megafood/src/utils/colors.dart';
import 'package:megafood/src/utils/text_style.dart';

class StarText extends StatelessWidget {
  final String rating;
  const StarText({super.key,
  required this.rating});

  @override
  Widget build(BuildContext context) {
    return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.star,
              color:ThemeColor.c16),
              Gap(5.w),
              Text(rating,
              style: MyTextStyle.t6,),
            ],
          );
  }
}