import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:megafood/src/utils/colors.dart';
import 'package:shimmer/shimmer.dart';

class CardThreeShimmer extends StatelessWidget {
  const CardThreeShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
            baseColor: ThemeColor.c17,
            highlightColor: ThemeColor.c1,
            child: Container(
            height: 250,
            width: 200.w,
            margin: EdgeInsets.symmetric(horizontal: 5.w),
            decoration: BoxDecoration(
            color:ThemeColor.c1,
              borderRadius: BorderRadius.circular(10)
            )
          ));
  }
}