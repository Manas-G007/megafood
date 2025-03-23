import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:megafood/src/utils/colors.dart';
import 'package:megafood/src/utils/text_style.dart';
import 'package:get/get.dart';

// info dialog
Future<dynamic> showInfoDialogBox(BuildContext context,String msg) {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        surfaceTintColor: ThemeColor.c1,
        shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        content: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset("assets/images/info.png",
            height: 150,),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10.h),
              child: Text(msg,
                style: MyTextStyle.t26,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
        actions: [
          GestureDetector(
            onTap: (){
              Get.back(result: true);
            },
            child: Center(
              child: Container(
                width: 200.w,
                margin: EdgeInsets.only(bottom: 10.h),
                padding: EdgeInsets.symmetric(vertical: 10.h),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  gradient: const LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors:[
                        ThemeColor.c33,
                        ThemeColor.c36
                      ]
                    )
                ),
                child: Text("Okay",
                style: MyTextStyle.t14,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ],
      );
    },
  );
}

// success info
Future<dynamic> showSuccessDialogBox(BuildContext context,String msg) {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        surfaceTintColor: ThemeColor.c1,
        shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        content: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset("assets/images/success.png",
            height: 150,),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10.h),
              child: Text(msg,
                style: MyTextStyle.t27,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
        actions: [
          GestureDetector(
            onTap: (){
              Get.back(result: true);
            },
            child: Center(
              child: Container(
                width: 200.w,
                margin: EdgeInsets.only(bottom: 10.h),
                padding: EdgeInsets.symmetric(vertical: 10.h),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  gradient: const LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors:[
                        ThemeColor.c34,
                        ThemeColor.c37
                      ]
                    )
                ),
                child: Text("Okay",
                style: MyTextStyle.t14,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ],
      );
    },
  );
}

// warning dialog
Future<dynamic> showWarningDialogBox(BuildContext context,String msg) {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        surfaceTintColor: ThemeColor.c1,
        shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        content: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset("assets/images/error.png",
            height: 150,),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10.h),
              child: Text(msg,
                style: MyTextStyle.t28,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
        actions: [
          GestureDetector(
            onTap: (){
              Get.back(result: true);
            },
            child: Center(
              child: Container(
                width: 200.w,
                margin: EdgeInsets.only(bottom: 10.h),
                padding: EdgeInsets.symmetric(vertical: 10.h),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  gradient: const LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors:[
                        ThemeColor.c35,
                        ThemeColor.c38
                      ]
                    )
                ),
                child: Text("Okay",
                style: MyTextStyle.t14,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ],
      );
    },
  );
}