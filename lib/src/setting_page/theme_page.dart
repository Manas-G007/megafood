import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:megafood/src/controller/theme_controller.dart';
import 'package:megafood/src/utils/colors.dart';
import 'package:megafood/src/utils/text_style.dart';
import 'package:megafood/src/widget/theme_card.dart';
import 'package:megafood/src/widgets/my_back_btn.dart';
import 'package:get/get.dart';

class MyThemePage extends StatefulWidget {
  const MyThemePage({super.key});

  @override
  State<MyThemePage> createState() => _MyThemePageState();
}

class _MyThemePageState extends State<MyThemePage> {
  List allItem=[];
  ThemeController themeController=Get.put(ThemeController());

  @override
  void initState(){
    super.initState();
    themeController.getTheme();
    allItem=themeController.themeList;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ThemeColor.c9,
        appBar: AppBar(
          backgroundColor: ThemeColor.c9,
          elevation: 0,
          automaticallyImplyLeading: false,
          title:  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap:(){
                          Get.back();
                        },
                        child: const MyBackBtn()),
                      Text("Themes",
                      style: MyTextStyle.t6,)
                    ],
                  ),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 30.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: List.generate(allItem.length, (index){
                        final unitItem=allItem[index];
                        return MyThemeCard(
                          type: index,
                          imgLink: unitItem["imgLink"],
                          text:unitItem["name"]);
                        }
                      ),),
          ),
        ),
      )
    );
  }
}
