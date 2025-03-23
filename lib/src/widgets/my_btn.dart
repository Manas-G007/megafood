import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:megafood/src/utils/colors.dart';
import 'package:megafood/src/utils/text_style.dart';

class MyBtn extends StatelessWidget {
  final String text;
  final bool isLoading;
  const MyBtn({super.key,
  required this.text,
  required this.isLoading});

  @override
  Widget build(BuildContext context) {
    return Container(
                width: double.maxFinite,
                height: 50,
                padding: EdgeInsets.symmetric(vertical: 12.h),
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
                child: Center(
                  child: isLoading?
                  const SizedBox(
                    width: 27,
                    child: CircularProgressIndicator(
                      color: ThemeColor.c1,
                    ),
                  )
                  :Text(text,
                  style: MyTextStyle.t3)),
              );
  }
}