import 'package:flutter/material.dart';
import 'package:megafood/src/utils/text_style.dart';
import 'package:megafood/src/widgets/my_back_btn.dart';
import 'package:get/get.dart';

class BackText extends StatelessWidget {
  final String text;
  const BackText({super.key,
  required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap:(){
                  Get.back();
                },
                child: const MyBackBtn()),
              Text(text,
              style: MyTextStyle.t6,)
            ],
          );
  }
}