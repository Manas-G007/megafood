import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:megafood/src/utils/colors.dart';
import 'package:megafood/src/utils/text_style.dart';

class OrderBtn extends StatelessWidget {
  final String text1;
  final String text2;
  const OrderBtn({super.key,
  required this.text1,
  required this.text2});

  @override
  Widget build(BuildContext context) {
    return Container(
                width: 220.w,
                height: double.maxFinite,
                padding: EdgeInsets.symmetric(horizontal: 15.w),
                decoration: BoxDecoration(
                  color:ThemeColor.c1,
                  borderRadius: BorderRadius.circular(50)
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(text1,
                    style:MyTextStyle.t18),
                    Text(text2,
                    style:MyTextStyle.t18)
                  ],
                ),
              );
  }
}