import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:megafood/src/utils/colors.dart';
import 'package:shimmer/shimmer.dart';

class CardOneShimmer extends StatelessWidget {
  const CardOneShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
            baseColor: ThemeColor.c17,
            highlightColor: ThemeColor.c1,
            child: Container(
            height: 200.h,
            width: 260.w,
            margin: EdgeInsets.symmetric(horizontal: 10.w),
            decoration: BoxDecoration(
            color:ThemeColor.c1,
              borderRadius: BorderRadius.circular(10)
            )
          ));
  }
}