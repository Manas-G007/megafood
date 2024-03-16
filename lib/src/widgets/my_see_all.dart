import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:megafood/src/utils/text_style.dart';

class MySeeAll extends StatelessWidget {
  final String text1;
  final String text2;
  const MySeeAll({super.key,
  required this.text1,
  required this.text2});

  @override
  Widget build(BuildContext context) {
    return Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10.h),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(text1,
                    style: MyTextStyle.t6,),
                    Text(text2,
                    style: MyTextStyle.t10)
                  ],
                ),
              );
  }
}