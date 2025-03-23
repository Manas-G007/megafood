import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:megafood/src/utils/colors.dart';
import 'package:megafood/src/utils/text_style.dart';
import 'package:megafood/src/widgets/my_rating_invert.dart';

class MyRatingImgText extends StatelessWidget {
  final String rating;
  final String imgUrl;
  final String text;
  const MyRatingImgText({super.key,
  required this.rating,
  required this.imgUrl,
  required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
          decoration: BoxDecoration(
              boxShadow:const [ 
              BoxShadow(
                color:ThemeColor.c2,
                offset: Offset(0, 4),
                blurRadius: 10
              )],
            borderRadius: BorderRadius.circular(10),
            gradient: const LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors:[
                ThemeColor.c4,
                ThemeColor.c5
              ]
            ),
          ),
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    height: 155.h,
                    padding: EdgeInsets.only(top:15.h),
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: ThemeColor.c1,
                    ),
                    child: SizedBox(
                      child: Image.network(imgUrl,cacheWidth: 130)
                      )
                  ),
                  Positioned(
                    top:10,
                    right: 10,
                    child: MyRatingInvert(rating: rating))
                ],
              ),
              const Gap(10),
              Text(text,style: MyTextStyle.t4)
            ],
          ),
        );        
  }
}