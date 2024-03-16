import 'package:flutter/material.dart';
import 'package:megafood/src/utils/text_style.dart';
import 'package:megafood/src/widgets/my_rating.dart';

class TextRating extends StatelessWidget {
  final String heading;
  final String rating;
  const TextRating({super.key,
  required this.heading,
  required this.rating});

  @override
  Widget build(BuildContext context) {
    return  Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(heading,
                style: MyTextStyle.t14),
                MyRating(rating: rating)
              ],
            );
  }
}