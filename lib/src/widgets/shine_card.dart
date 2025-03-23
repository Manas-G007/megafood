import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:megafood/src/utils/colors.dart';
import 'package:megafood/src/utils/text_style.dart';

class ShineCard extends StatelessWidget {
  final int index;
  final IconData icon;
  final int val;
  final String text2;
  const ShineCard({super.key,
  required this.index,
  required this.icon,
  required this.val,
  required this.text2});

  @override
  Widget build(BuildContext context) {
    return Container(
              margin: const EdgeInsets.all(10),
              decoration:BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors:index==0?[
                    ThemeColor.c18,
                    ThemeColor.c19
                  ]:index==1?[
                    ThemeColor.c8,
                    ThemeColor.c20
                  ]:index==2?[
                    ThemeColor.c21,
                    ThemeColor.c22
                  ]:index==3?[
                    ThemeColor.c23,
                    ThemeColor.c24
                  ]:[]
                )
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(icon,
                  color:ThemeColor.c1,
                  size:30),
                  Text(val.toString(),
                  style: MyTextStyle.t15),
                  Text(text2,
                  style:MyTextStyle.t9),
                  Text("delivery",
                  style:MyTextStyle.t9),
                ],
              ),
            );
  }
}