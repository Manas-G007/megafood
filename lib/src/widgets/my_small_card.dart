import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:megafood/src/utils/colors.dart';
import 'package:megafood/src/utils/text_style.dart';

class MySmallCard extends StatelessWidget {
  final String imgPath;
  final String text;
  const MySmallCard({super.key,
  required this.imgPath,
  required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
                      height: 140,
                      width: 120.w,
                      margin: EdgeInsets.symmetric(horizontal: 5.w),
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color:ThemeColor.c1,
                        borderRadius: BorderRadius.circular(8),
                        boxShadow:const [ 
                        BoxShadow(
                          color:ThemeColor.c2,
                          offset: Offset(0, 4),
                          blurRadius: 10
                        )],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding:EdgeInsets.only(top:10.h),
                            child: Image.network(imgPath,
                            width: 90.w,
                            ),
                          ),
                          Container(
                            width: double.maxFinite,
                            padding: EdgeInsets.symmetric(vertical: 5.h),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              gradient: const LinearGradient(
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                    colors:[
                                      ThemeColor.c4,
                                      ThemeColor.c5
                                    ]
                                  ),                            
                              boxShadow:const [ 
                              BoxShadow(
                                color:ThemeColor.c2,
                                offset: Offset(0, 4),
                                blurRadius: 10
                              )],
                            ),
                            child: Center(
                              child: Text(text,
                              style: MyTextStyle.t9,
                              overflow: TextOverflow.ellipsis,),
                            ),
                          )
                        ],
                      ),
                    )
 ;
  }
}