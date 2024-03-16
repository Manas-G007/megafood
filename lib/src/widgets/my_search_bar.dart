import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:megafood/src/utils/colors.dart';
import 'package:megafood/src/utils/text_style.dart';

class MySearchBar extends StatelessWidget {
  final TextEditingController controller;
  final bool isTouch;
  const MySearchBar({super.key,
  required this.controller,
  required this.isTouch});

  @override
  Widget build(BuildContext context) {
    return Container(
                padding: EdgeInsets.symmetric(horizontal: 15.w),
                decoration: BoxDecoration(
                   color:ThemeColor.c1,
                   borderRadius: BorderRadius.circular(10.0),
                   boxShadow:const [ 
                    BoxShadow(
                      color:ThemeColor.c2,
                      offset: Offset(0, 4),
                      blurRadius: 10
                   )]
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    !isTouch?SizedBox(
                      width: 260.w,
                      child: TextField(
                        controller: controller,
                        style: MyTextStyle.t7,
                        cursorColor: ThemeColor.c11,
                        decoration: InputDecoration(                          
                          border: InputBorder.none,
                          hintText: "Seach ...",
                          hintStyle: MyTextStyle.t7
                        ),
                      ),
                    ):Padding(
                      padding: EdgeInsets.symmetric(vertical: 10.h),
                      child: Text("Seach ...",
                          style: MyTextStyle.t7),
                    ),
                    const Icon(Icons.search,
                    color: ThemeColor.c11,)
                  ],
                ),
              );
  }
}