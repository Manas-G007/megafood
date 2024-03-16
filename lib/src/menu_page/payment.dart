import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:megafood/src/utils/colors.dart';
import 'package:megafood/src/utils/text_style.dart';
import 'package:megafood/src/widget/back_text.dart';
import 'package:megafood/src/widget/my_line.dart';
import 'package:megafood/src/widget/order_btn.dart';
import 'package:megafood/src/widget/text_price.dart';
import 'package:megafood/src/widget/tick_text.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ThemeColor.c9,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: ThemeColor.c9,
          automaticallyImplyLeading: false,
          title: const BackText(text: "Payment"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Gap(15.h),
              const TextPrice(text: "Sub Amount", price: "₹ 100"),
              const TextPrice(text: "Delivery", price: "₹ 10"),
              const MyLine(width: 1),
              Gap(10.h),
              const TextPrice(text: "Total Amount", price: "₹ 110"),
            ]),
        ),
        bottomNavigationBar: Container(
          width: double.maxFinite,
          height: 560.h,
          decoration:const BoxDecoration(
            borderRadius: BorderRadius.vertical(
              top:Radius.circular(20)
            ),
            gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors:[
                      ThemeColor.c4,
                      ThemeColor.c5
                    ]
                  )
          ),
          child:Column(
            children: [
              Container(
                height: 500.h,
                width: double.maxFinite,
                padding: const EdgeInsets.all(10),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.vertical(
                    top:Radius.circular(20)
                  ),
                  color:ThemeColor.c7
                ),
                child: Column(
                  children: [
                    Container(
                        width: double.maxFinite,
                        height: 120,
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                        decoration: BoxDecoration(
                          color:ThemeColor.c1,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow:const [ 
                              BoxShadow(
                                color:ThemeColor.c2,
                                offset: Offset(0, 5),
                                blurRadius: 15
                              )],
                        ),
                        child:const SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TickText(text: "Cash On Delivery"),
                              MyLine(width: 1),
                              TickText(text: "Visa/Debit/Credit"),
                            ],
                          ),
                        ),
                      ),
                      Image.asset("assets/images/img00.png",
                      width: 340.w)
                  ],
                ),
              ),
              Container(
                height: 60.h,
                padding: EdgeInsets.symmetric(horizontal: 15.w,vertical: 10.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 120.w,
                      child: Center(
                        child: Text("3 Items",
                        style:MyTextStyle.t3),
                      ),
                    ),     
                    const OrderBtn(text1: "Continue", text2: "₹ 100")
                  ],
                ),
              ),
            ],
          )
        ),
      ),
    );
  }
}