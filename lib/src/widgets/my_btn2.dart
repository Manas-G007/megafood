import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:megafood/src/utils/colors.dart';
import 'package:megafood/src/utils/text_style.dart';

class MyBtn2 extends StatelessWidget {
  final String text;
  final bool isLoading;
  const MyBtn2({super.key,
  required this.text,
  required this.isLoading});

  @override
  Widget build(BuildContext context) {
    return Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(vertical: 12.h),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors:[
                      ThemeColor.c25,
                      ThemeColor.c26
                    ]
                  ),
                  borderRadius: BorderRadius.circular(10)
                ),
                child: Center(
                  child: isLoading?
                  const CircularProgressIndicator(
                    color: ThemeColor.c1,
                  )
                  :Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.call,
                        color: ThemeColor.c1,),
                      Gap(10.w),
                      Text(text,
                      style: MyTextStyle.t3),
                    ],
                  )),
              );
  }
}