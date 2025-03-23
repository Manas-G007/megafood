import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:megafood/src/utils/colors.dart';

class GlowCircle extends StatelessWidget {
  final bool isGlow;
  const GlowCircle({super.key,
  required this.isGlow});

  @override
  Widget build(BuildContext context) {
    return Container(
            height: 33.sp,
            width: 33.sp,
            decoration: BoxDecoration(
              gradient: RadialGradient(
                focal: Alignment.topCenter,
                radius: 1,
                colors:isGlow?[
                  ThemeColor.c27,
                  ThemeColor.c28
                ]:[ThemeColor.c1,ThemeColor.c1]
              ),
              borderRadius: BorderRadius.circular(50),
              border:Border.all(
                color: ThemeColor.c17,
                width: 3
              )
            ),
          );
  }
}