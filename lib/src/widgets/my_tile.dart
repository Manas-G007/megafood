import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:megafood/src/utils/colors.dart';
import 'package:megafood/src/utils/text_style.dart';

class MyTile extends StatelessWidget {
  final IconData icon;
  final String text;
  const MyTile({super.key,
  required this.icon,
  required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
          width: double.maxFinite,
          height: 50.h,
          margin: EdgeInsets.only(bottom: 16.h),
          padding: EdgeInsets.only(left: 14.w,right: 8.w),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors:[
                ThemeColor.c4,
                ThemeColor.c5
              ]
            ),
            borderRadius: BorderRadius.circular(10)
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(icon,
                  color:ThemeColor.c1,
                  size: 25.sp),
                  Gap(12.w),
                  Text(text,
                  style: MyTextStyle.t14,)
                ],
              ),
              Icon(Icons.chevron_right_outlined,
              color:ThemeColor.c1,
              size:30.sp)
            ],
          ),
        );
  }
}