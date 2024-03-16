import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:megafood/src/controller/userdata_controller.dart';
import 'package:megafood/src/utils/snack_bars.dart';
import 'package:megafood/src/setting_page/edit_profile_page.dart';
import 'package:megafood/src/utils/colors.dart';
import 'package:megafood/src/utils/text_style.dart';
import 'package:megafood/src/widgets/my_tile.dart';
import 'package:get/get.dart';
import 'package:megafood/src/widgets/profile_img.dart';
import 'package:megafood/src/widgets/side_head_text.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MySettingPage extends StatefulWidget {
  const MySettingPage({super.key});

  @override
  State<MySettingPage> createState() => _MySettingPageState();
}

class _MySettingPageState extends State<MySettingPage> {

  UserController userController=Get.find();

  void signOut() async {
    SharedPreferences pref=await SharedPreferences.getInstance();
    try{
      await FirebaseAuth.instance.signOut();
      pref.clear();
      userController.clearValue();
      if(mounted){
        MySnackBar.successSnackBar(context, "Logged out Successfully!");
      }
    }catch(e){
      if(mounted){
        MySnackBar.errorSnackBar(context, "Something Went Wrong!!");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ThemeColor.c9,
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Settings",
              style: MyTextStyle.t6),
              Gap(20.h),
              Obx(
                (){ 
                  var data=userController.userData.value;
                  return Row(children: [
                  ProfileImage(size: 80, imagePath: "${data==""?"":jsonDecode(data)['imgLink']}"),
                  Gap(20.w),
                  SideTextHead(text1: "${data==""?"Loading ...":jsonDecode(data)['name']}", text2: "Feeling Hungry Today")
                ],);},
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 25.h),
                child: Column(
                  children: [
                    GestureDetector(
                      onTap:(){
                        Get.to(()=>const MyEditPage(),
                        transition: Transition.rightToLeft);
                      },
                      child: const MyTile(icon: CupertinoIcons.person_alt, text: "Edit Profile")),
                    const MyTile(icon: Icons.color_lens, text: "Theme"),
                    const MyTile(icon: CupertinoIcons.cube_box_fill, text: "Order"),
                    const MyTile(icon: Icons.lock_person, text: "Privacy Policy"),
                    GestureDetector(
                      onTap: signOut,
                      child: const MyTile(icon: Icons.power_settings_new, text: "Logout"))
                  ],
                ),
              )
            ],
          ),
        ),
      )
    );
  }
}