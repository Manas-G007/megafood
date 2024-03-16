import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:megafood/src/utils/colors.dart';
import 'package:megafood/src/utils/text_style.dart';

class TickText extends StatefulWidget {
  final String text;
  const TickText({super.key,
  required this.text});

  @override
  State<TickText> createState() => _TickTextState();
}

class _TickTextState extends State<TickText> {
  bool tick=true;

  void toggleTick(){
    setState(() {
      tick=!tick;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 15.h),
      child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(widget.text,
                  style: MyTextStyle.t16,),
                GestureDetector(
                  onTap: () {
                    toggleTick();
                  },
                  child: Icon(
                    tick?Icons.circle:Icons.check_circle,
                  color:ThemeColor.c30,
                  size: 26,),
                )
              ],
            ),
    );
  }
}