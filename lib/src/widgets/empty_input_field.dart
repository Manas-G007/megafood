import 'package:flutter/material.dart';
import 'package:megafood/src/utils/colors.dart';
import 'package:megafood/src/utils/text_style.dart';

class MyBlankField extends StatelessWidget {
  final TextEditingController controller;
  final String text;
  final bool? isLocation;
  final bool? isReciever;
  const MyBlankField({super.key,
  required this.controller,
  required this.text,
  this.isLocation,  
  this.isReciever});

  @override
  Widget build(BuildContext context) {
    return TextField(
            controller:controller,
            style: MyTextStyle.t6,
            cursorColor: ThemeColor.c11,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: text,
              hintStyle:MyTextStyle.t6,
              labelText: text,
              suffixIcon: isLocation==null?null: 
              Icon(
                Icons.push_pin_rounded,
                color:isReciever==null? ThemeColor.c30: ThemeColor.c29),
            ),
          );
  }
}