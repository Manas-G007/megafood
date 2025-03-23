import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:megafood/src/utils/colors.dart';
import 'package:megafood/src/utils/text_style.dart';

class MyRatingInvert extends StatelessWidget {
  final String rating;
  const MyRatingInvert({super.key,
  required this.rating});

  @override
  Widget build(BuildContext context) {
    return Container(
            height: 25.h,
            width: 50.w,
            padding: EdgeInsets.symmetric(horizontal: 5.w),
            decoration: BoxDecoration(
               gradient: const LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors:[
                    ThemeColor.c4,
                    ThemeColor.c5
                  ]
                ),
              borderRadius: BorderRadius.circular(30)
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
              const Icon(Icons.star,
              color: ThemeColor.c20,
              size:18),
              Text(rating,
              style:MyTextStyle.t13)
            ],),
          );
}
}