import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:megafood/src/home_page/home_page.dart';
import 'package:megafood/src/order_page/order_page.dart';
import 'package:megafood/src/setting_page/setting_page.dart';
import 'package:megafood/src/tracker_page/tracker_page.dart';
import 'package:megafood/src/utils/colors.dart';
import 'package:megafood/src/utils/text_style.dart';
import 'package:get/get.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int selectedPage=0;
  List pages=[const MyHomePage(),null,const TrackerPage(),const MySettingPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeColor.c9,
      body: pages[selectedPage],
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(10),
        child: GNav(
          selectedIndex: selectedPage,
          onTabChange: (value) {
            if(value==1){
              Get.to(
                ()=>const OrderPage(),
                transition: Transition.rightToLeft
              );
              return;
            }
            setState(() {
              selectedPage=value;
            });
          },
          hoverColor: ThemeColor.c6,
          rippleColor: ThemeColor.c6,
          tabBorderRadius: 25, 
          gap: 8, 
          color: ThemeColor.c8, 
          activeColor: ThemeColor.c1, 
          iconSize: 24,
          tabBackgroundGradient: const LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors:[
                      ThemeColor.c4,
                      ThemeColor.c5
                    ]
                  ),
          padding: EdgeInsets.symmetric(horizontal: 20.w,vertical: 10.h), 
          tabs:[
            GButton(
              icon: Icons.home,
              text: 'Home',
              textStyle: MyTextStyle.t4,
            ),
            GButton(
              icon: Icons.fastfood_outlined,
              text: 'Menu',
              textStyle: MyTextStyle.t4,
            ),
            GButton(
              icon: Icons.directions_bike,
              text: 'Track',
              textStyle: MyTextStyle.t4,
            ),
            GButton(
              icon: Icons.settings,
              text: 'Setting',
              textStyle: MyTextStyle.t4,
            )
          ]
          ),
      ));
  }
}