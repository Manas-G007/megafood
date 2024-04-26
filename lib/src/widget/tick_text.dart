import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:megafood/src/utils/colors.dart';
import 'package:megafood/src/utils/text_style.dart';

class TickText extends StatelessWidget {
  final String text;
  final bool status;
  const TickText({super.key,
  required this.text,
  required this.status});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 15.h),
      child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(text,
                  style: MyTextStyle.t16,),
                GestureDetector(
                  child: Icon(
                    status?Icons.check_circle:Icons.circle,
                  color:ThemeColor.c30,
                  size: 26,),
                )
              ],
            ),
    );
  }
}