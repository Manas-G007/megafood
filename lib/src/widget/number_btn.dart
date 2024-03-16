import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:megafood/src/utils/colors.dart';

class NumberBtn extends StatelessWidget {
  final bool isAdd;
  final bool? isSmall;
  const NumberBtn({super.key,
  required this.isAdd,
  this.isSmall
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: isSmall==null? 40.sp:24.sp,
      width: isSmall==null? 40.sp:24.sp,
      decoration: BoxDecoration(
        color:ThemeColor.c1,
        borderRadius: BorderRadius.circular(50)
      ),
      child: Icon(isAdd?Icons.add:Icons.remove,
      color: isAdd?ThemeColor.c30:ThemeColor.c29,
      size: isSmall==null? 30.sp:20.sp),
    );
  }
}