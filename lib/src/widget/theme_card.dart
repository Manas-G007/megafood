import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:megafood/src/utils/colors.dart';
import 'package:megafood/src/utils/popups.dart';
import 'package:megafood/src/utils/text_style.dart';

class MyThemeCard extends StatefulWidget {
  final String text;
  final String imgLink;
  final int type;
  const MyThemeCard({super.key,
  required this.text,
  required this.imgLink,
  required this.type});

  @override
  State<MyThemeCard> createState() => _MyThemeCardState();
}

class _MyThemeCardState extends State<MyThemeCard> {

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:(){
        if(widget.type==0){
          showSuccessDialogBox(context, "Selected Already");
        }else{
          showInfoDialogBox(context, "Coming Soon :>");
        }
      },
      child: Padding(
                padding: EdgeInsets.symmetric(vertical: 10.h,horizontal: 20.w),
                child: Stack(
                  children: [
                    Container(
                      width: double.maxFinite,
                      height: 110,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors:
                        widget.type==0?[
                          ThemeColor.c4,
                          ThemeColor.c5
                        ]:widget.type==1?[
                          ThemeColor.c21,
                          ThemeColor.c31
                        ]:[
                          ThemeColor.c39,
                          ThemeColor.c3
                        ]
                      ),
                      borderRadius: BorderRadius.circular(20)
                    ),
                  ),
                  Positioned(
                    bottom: 10,
                    left: 20,
                    child: Text(widget.text,
                    style: MyTextStyle.t29)),
                  Positioned(
                    top: 14,
                    right: 20,
                    child:Image.asset(widget.imgLink,width: 90+((3-widget.type)*10),)),
                  ],
                ),
              ),
    )
      ;
  }
}