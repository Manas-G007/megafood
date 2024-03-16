import 'package:flutter/material.dart';
import 'package:megafood/src/utils/text_style.dart';

class TextPrice extends StatelessWidget {
  final String text;
  final String price;
  const TextPrice({super.key,
  required this.text,
  required this.price});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(text,
                style: MyTextStyle.t16,),
                Text(price,
                style: MyTextStyle.t6,)
              ],
            ),
    );
  }
}