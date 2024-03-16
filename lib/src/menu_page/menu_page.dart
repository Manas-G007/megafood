import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:megafood/src/utils/colors.dart';
import 'package:megafood/src/widget/back_text.dart';
import 'package:megafood/src/widgets/my_search_bar.dart';
import 'package:megafood/src/widgets/my_side_card.dart';

class MyMenuPage extends StatefulWidget {
  const MyMenuPage({super.key});

  @override
  State<MyMenuPage> createState() => _MyMenuPageState();
}

class _MyMenuPageState extends State<MyMenuPage> {
  final TextEditingController _searchController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ThemeColor.c9,
        appBar: AppBar(
          backgroundColor: ThemeColor.c9,
          elevation: 0,
          automaticallyImplyLeading: false,
          toolbarHeight: 130.h,
          title: SizedBox(
            height: 130.h,
            child: Padding(
              padding: const EdgeInsets.all(5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const BackText(text: "Discover New Taste"),
                  Gap(18.h),
                  MySearchBar(
                    controller: _searchController,
                    isTouch: false,
                  ),
                ],
              ),
            ),
          )
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 0,horizontal: 20),
            child: Column(
              children: [
                SizedBox(
                  child: Column(
                    children: List.generate(10, (index) =>
                        MySideCard(
                          imgPath: "assets/images/food${(index + 1) % 4}.png",
                          heading: "Burger",
                          rating: "4.7",
                          timeVal: "25 Min",
                          distanceVal: "2.5 Km",
                          smileVal: "36 Smile",
                        ),
                    ),
                  ),
                )      
              ],
            ),
          ),
        ),
      )
      );
  }
}