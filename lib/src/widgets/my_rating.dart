import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:megafood/src/utils/colors.dart';
import 'package:megafood/src/utils/text_style.dart';

class MyRating extends StatelessWidget {
  final String rating;
  final bool? isBig;
  const MyRating({super.key,
  required this.rating,
  this.isBig});

  @override
  Widget build(BuildContext context) {
    return Container(
            height: isBig==null?20.h:30.h,
            width: isBig==null?40.w:70.h,
            padding: EdgeInsets.symmetric(horizontal: 5.w),
            decoration: BoxDecoration(
              color: ThemeColor.c1,
              borderRadius: BorderRadius.circular(isBig==null?10:30)
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
              Icon(Icons.star,
              color: ThemeColor.c16,
              size:isBig==null?14:20),
              Text(rating,
              style: isBig==null?MyTextStyle.t12:MyTextStyle.t19)
            ],),
          );
}
}