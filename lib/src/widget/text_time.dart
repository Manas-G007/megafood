import 'package:flutter/material.dart';
import 'package:megafood/src/utils/text_style.dart';

class TextTime extends StatelessWidget {
  final String time;
  const TextTime({super.key,
  required this.time});

  @override
  Widget build(BuildContext context) {
    return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Estimated Time",
              style:MyTextStyle.t6),
              Text(time,
              style:MyTextStyle.t16)
            ],
          );
  }
}