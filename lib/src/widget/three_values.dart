import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:megafood/src/utils/colors.dart';
import 'package:megafood/src/widget/icon_text_row.dart';

class ThreeValue extends StatelessWidget {
  final String text1;
  final String text2;
  final String text3;
  const ThreeValue({super.key,
  required this.text1,
  required this.text2,
  required this.text3,});

  @override
  Widget build(BuildContext context) {
    return Padding(
                  padding: EdgeInsets.only(top:10.h,bottom: 15.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconTextRow(
                        color: ThemeColor.c31, 
                        icon: Icons.access_time_filled,
                        text: text1),
                      IconTextRow(
                        color: ThemeColor.c29, 
                        icon: Icons.fmd_good,
                        text: text2),
                      IconTextRow(
                        color: ThemeColor.c30, 
                        icon: Icons.emoji_emotions,
                        text: text3)
                    ],
                  ),
                );
  }
}