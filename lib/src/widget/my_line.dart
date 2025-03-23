import 'package:flutter/material.dart';
import 'package:megafood/src/utils/colors.dart';

class MyLine extends StatelessWidget {
  final double width;
  final double? limit;
  final double? radius;
  const MyLine({super.key,
  required this.width,
  this.limit,
  this.radius});

  @override
  Widget build(BuildContext context) {
    return  Container(
              width: limit??double.maxFinite,
              height: width,
              decoration: BoxDecoration(
                color:ThemeColor.c17,
                borderRadius: BorderRadius.circular(radius??0)
              ),
            );
  }
}