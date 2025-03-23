import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:megafood/src/controller/order_controller.dart';
import 'package:megafood/src/utils/colors.dart';
import 'package:megafood/src/utils/text_style.dart';
import 'package:megafood/src/widget/empty_component.dart';
import 'package:megafood/src/widget/glow_circle.dart';
import 'package:megafood/src/widget/my_line.dart';
import 'package:megafood/src/widget/text_time.dart';
import 'package:megafood/src/widgets/tracker_card.dart';
import 'package:get/get.dart';

class TrackerPage extends StatefulWidget {
  const TrackerPage({super.key});

  @override
  State<TrackerPage> createState() => _TrackerPageState();
}

class _TrackerPageState extends State<TrackerPage> {

  OrderController orderController=Get.put(OrderController());

  List temp=[
    [
      45,
      "Successful",
      Icons.stars_rounded
    ],
    [
      55,
      "Total today",
      Icons.sunny
    ],
    [
      44,
      "Total earn",
      Icons.monetization_on
    ],
    [
      45,
      "Total smile",
      Icons.emoji_emotions
    ]
    ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ThemeColor.c9,
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Obx(()=>Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w,vertical: 15.h),
                child: Text("Track your order",
                style: MyTextStyle.t6),
              ),
              !orderController.isOrdered.value?
              const EmptyCart()
              :TrackerCard(temp: temp),
              !orderController.isOrdered.value?const SizedBox():Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(horizontal: 20.w,vertical: 20.h),
                child: Column(
                  children: [
                    const TextTime(time: "20 Mins"),
                    Gap(25.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const GlowCircle(isGlow: true),
                        MyLine(width: 4,limit: 80.w,radius: 20),
                        const GlowCircle(isGlow: false),
                        MyLine(width: 4,limit: 80.w,radius: 20),
                        const GlowCircle(isGlow: false)
                      ],
                    ),
                    Gap(20.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Order Placed",
                        style:MyTextStyle.t17),
                        Text("On the way   ",
                        style:MyTextStyle.t17),
                        Text("Delievered",
                        style:MyTextStyle.t17),
                      ],
                    )
                  ],
                ),
              )
              
            ],
          )),
        )
        ));
  }
}