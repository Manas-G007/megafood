import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:megafood/src/utils/colors.dart';
import 'package:megafood/src/utils/text_style.dart';
import 'package:megafood/src/widgets/my_icon_text.dart';
import 'package:megafood/src/widgets/my_rating.dart';

class MyBigCard extends StatelessWidget {
  final String imgPath;
  final String heading;
  final String rating;
  final String timeVal;
  final String distanceVal;
  final String smileVal;
  const MyBigCard({super.key,
  required this.imgPath,
  required this.heading,
  required this.rating,
  required this.timeVal,
  required this.distanceVal,
  required this.smileVal});

  @override
  Widget build(BuildContext context) {
    return Container(
                      height: 250,
                      width: 200.w,
                      margin: const EdgeInsets.symmetric(horizontal: 5),
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
                        children: [
                          Image.network(imgPath,
                          width: 170.w,),
                          Container(
                            height: 80,
                            width: double.maxFinite,
                            padding: const EdgeInsets.all(10),
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
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                  Text(heading,
                                  style: MyTextStyle.t11),
                                  MyRating(rating: rating)
                                ],),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    MyIconText(icon: Icons.access_time_filled, val: "$distanceVal Km",size:15),
                                    MyIconText(icon: Icons.fmd_good, val: "$timeVal Min",size:15),
                                    MyIconText(icon: Icons.emoji_emotions, val: "$smileVal Smile",size:15)
                                  ],
                                )

                              ]
                              ),
                          )
                        ]),
                    )
                    ;
  }
}