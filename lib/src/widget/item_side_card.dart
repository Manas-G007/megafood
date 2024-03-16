import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:megafood/src/utils/colors.dart';
import 'package:megafood/src/utils/text_style.dart';
import 'package:megafood/src/widget/number_btn.dart';
import 'package:megafood/src/widget/text_rating.dart';

class ItemSideCard extends StatefulWidget {
  final String imgPath;
  final String heading;
  final String rating;
  final String price;
  const ItemSideCard({super.key,
  required this.imgPath,
  required this.heading,
  required this.rating,
  required this.price});

  @override
  State<ItemSideCard> createState() => _ItemSideCardState();
}

class _ItemSideCardState extends State<ItemSideCard> {
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
                    child: Image.asset(widget.imgPath,
                    width: 100.w),
                  ),
                  Container(
                    width: 210.w,
                    height: double.maxFinite,
                    padding: EdgeInsets.symmetric(horizontal: 20.w,vertical: 15.h),
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
                        TextRating(heading:widget.heading, rating: widget.rating),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(widget.price,
                            style: MyTextStyle.t14,),
                            SizedBox(
                              width: 70.w,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  const NumberBtn(isAdd: false,isSmall: true),
                                  Text("1",
                                  style: MyTextStyle.t9),
                                  const NumberBtn(isAdd: true,isSmall: true),
                                ],),
                            ),
                          ],
                        )
                      ],
                    ),
                  )]
                  )
                  );
  }
}