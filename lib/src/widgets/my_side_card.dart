import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:megafood/src/utils/colors.dart';
import 'package:megafood/src/widget/text_rating.dart';
import 'package:megafood/src/widgets/my_icon_text.dart';

class MySideCard extends StatelessWidget {
  final String imgPath;
  final String heading;
  final String rating;
  final String timeVal;
  final String distanceVal;
  final String smileVal;
  const MySideCard({super.key,
  required this.imgPath,
  required this.heading,
  required this.rating,
  required this.timeVal,
  required this.distanceVal,
  required this.smileVal});

  @override
  Widget build(BuildContext context) {
    return Container(
            height: 110,
            width: double.maxFinite,
            margin: EdgeInsets.symmetric(vertical: 5.h),
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              color:ThemeColor.c1,
              borderRadius: BorderRadius.circular(10),
              boxShadow:const [ 
              BoxShadow(
                color:ThemeColor.c2,
                offset: Offset(0, 4),
                blurRadius: 10
              )],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(left:12.w),
                  child: Image.network(imgPath,
                  width: 100.w),
                ),
                Container(
                  width: 210.w,
                  height: double.maxFinite,
                  padding: EdgeInsets.symmetric(horizontal: 15.w,vertical: 15.h),
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
                      TextRating(heading: heading, rating: rating),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          MyIconText(icon: Icons.access_time_filled, val: distanceVal,size:17),
                          MyIconText(icon: Icons.fmd_good, val: timeVal,size:17),
                          MyIconText(icon: Icons.emoji_emotions, val: smileVal,size:17)
                        ],
                      )

                    ],
                  ),
                )
              ],
            ),
          );
}
}