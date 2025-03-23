import 'package:flutter/material.dart';
import 'package:megafood/src/utils/text_style.dart';

class SideTextHead extends StatelessWidget {
  final String text1;
  final String text2;
  const SideTextHead({super.key,
  required this.text1,
  required this.text2});

  @override
  Widget build(BuildContext context) {
    return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(text1,
              style: MyTextStyle.t1),
              Text(text2,
              style: MyTextStyle.t10)
            ],
          );
  }
}