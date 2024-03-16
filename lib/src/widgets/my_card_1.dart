import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:megafood/src/utils/colors.dart';
import 'package:megafood/src/utils/text_style.dart';

class MyCard1 extends StatelessWidget {
  final int cardType;
  final String imgPath;
  final String text1;
  final String text2;
  const MyCard1({super.key,
  required this.cardType,
  required this.imgPath,
  required this.text1,
  required this.text2});

  @override
  Widget build(BuildContext context) {
    return Container(
                      height: 200.h,
                      width: 260.w,
                      margin: EdgeInsets.symmetric(horizontal: 10.w),
                      decoration: BoxDecoration(
                        boxShadow:const [ 
                        BoxShadow(
                          color:ThemeColor.c2,
                          offset: Offset(0, 4),
                          blurRadius: 10
                        )],
                        gradient: LinearGradient(
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                    colors:
                                    cardType==0?[
                                      ThemeColor.c12,
                                      ThemeColor.c13
                                    ]:
                                    cardType==1?[
                                      ThemeColor.c12,
                                      ThemeColor.c14
                                    ]:[
                                      ThemeColor.c12,
                                      ThemeColor.c15
                                    ]
                                  ),
                       borderRadius: BorderRadius.circular(10)
                      ),
                      child: Stack(
                        children: [
                          Positioned(
                            bottom: 18.h,
                            right: 0,
                            child: Image.network(imgPath,
                            width: 140)),
                          Padding(
                            padding: const EdgeInsets.all(20),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(text1,
                                style: MyTextStyle.t8),
                                Text(text2,
                                style: MyTextStyle.t8,),
                                Gap(15.h),
                                Container(
                                  padding: EdgeInsets.symmetric(horizontal: 15.w,vertical: 8.h),
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
                                  child: Text("Order Now",
                                  style: MyTextStyle.t9,
                                  ),
                                )
                              ],
                            ),
                          )
                        ]
                      ),
                    );
  }
}