import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:megafood/src/utils/colors.dart';
import 'package:megafood/src/widgets/my_btn2.dart';
import 'package:megafood/src/widgets/profile_img.dart';
import 'package:megafood/src/widgets/shine_card.dart';
import 'package:megafood/src/widgets/side_head_text.dart';

class TrackerCard extends StatelessWidget {
  final List temp;
  const TrackerCard({super.key,
  required this.temp});

  @override
  Widget build(BuildContext context) {
    return Container(
              height: 530.h,
              width: double.maxFinite,
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color:ThemeColor.c1,
                 boxShadow:const [ 
                  BoxShadow(
                    color:ThemeColor.c2,
                    offset: Offset(0, 5),
                    blurRadius: 15
                  )],
                borderRadius: const BorderRadius.all(
                  Radius.circular(10)
                  ).copyWith(topLeft: const Radius.circular(70))
              ),
              child:Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      children: [
                        const ProfileImage(size: 100, imagePath: "assets/images/pic1.png"),
                        Gap(20.w),
                        const SideTextHead(text1: "Delivery Guy", text2: "Out of delivery")
                      ],
                    ),
                  ),
                  Expanded(
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        mainAxisExtent: 155.h,
                        crossAxisCount: 2), 
                      itemCount: 4,
                      itemBuilder: (BuildContext context, index){
                        return ShineCard(
                          index: index,
                          icon: temp[index][2], 
                          val: temp[index][0], 
                          text2: temp[index][1]);
                      } 
                      ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(10),
                    child: MyBtn2(text: "Call Now", isLoading: false),
                  )
                ]),
            )
            ;
  }
}