import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:megafood/src/utils/colors.dart';
import 'package:megafood/src/utils/text_style.dart';

class MyBackBtn extends StatelessWidget {
  const MyBackBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
                height: 30.h,
                width: 80.w,
                padding: EdgeInsets.only(right: 10.w),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors:[
                      ThemeColor.c4,
                      ThemeColor.c5
                    ]
                  ),
                  borderRadius: BorderRadius.circular(30)
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(Icons.chevron_left,
                    size:30.h,
                    color:ThemeColor.c1),
                    Text("back",
                    style: MyTextStyle.t11,)
                  ],
                ),
              );
  }
}