import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:megafood/src/menu_page/menu_page.dart';
import 'package:megafood/src/utils/text_style.dart';
import 'package:megafood/src/widgets/my_btn.dart';
import 'package:get/get.dart';

class EmptyCart extends StatelessWidget {
  const EmptyCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
            padding: EdgeInsets.symmetric(vertical: 60.h,horizontal: 50.w),
            child: Column(
              children: [
                Image.asset("assets/images/empty.png",
                width: 200,),
                Text("Your cart is empty go and do some shopping",
                style: MyTextStyle.t6,
                textAlign: TextAlign.center),
                Gap(40.h),
                GestureDetector(
                  onTap: (){
                    Get.to(()=>const MyMenuPage());
                  },
                  child: const MyBtn(text: "Go to Store", isLoading: false))
              ],
            ),
          );
  }
}