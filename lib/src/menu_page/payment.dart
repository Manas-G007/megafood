import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:megafood/src/controller/order_controller.dart';
import 'package:megafood/src/home_page/bottom_navigation.dart';
import 'package:megafood/src/utils/colors.dart';
import 'package:megafood/src/utils/popups.dart';
import 'package:megafood/src/utils/text_style.dart';
import 'package:megafood/src/widget/back_text.dart';
import 'package:megafood/src/widget/my_line.dart';
import 'package:megafood/src/widget/order_btn.dart';
import 'package:megafood/src/widget/text_price.dart';
import 'package:megafood/src/widget/tick_text.dart';
import 'package:get/get.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  OrderController orderController=Get.put(OrderController());
  List<bool> option=[false,false];

  void setOption(int select){
    setState(() {
      if(select==0){
        option[select]=true;
        option[1]=false;
      }else{
        option[select]=true;
        option[0]=false;
      }
    });
  }

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
              TextPrice(text: "Sub Amount", price: "₹ ${orderController.totalPrice}"),
              const TextPrice(text: "Delivery", price: "₹ 10"),
              const MyLine(width: 1),
              Gap(10.h),
              TextPrice(text: "Total Amount", price: "₹ ${orderController.totalPrice.value+10}"),
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
                        child:SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTap: ()=>setOption(0),
                                child: TickText(text: "Cash On Delivery",status: option[0])),
                              const MyLine(width: 1),
                              GestureDetector(
                                onTap: ()=>setOption(1),
                                child: TickText(text: "Pay through UPI",status: option[1])),
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
                        child: Text("${orderController.totalItem.value!=0 ? orderController.totalItem:""} ${orderController.totalItem.value==0?"No Item":orderController.totalItem.value==1?"Item":"Items"}",
                        style:MyTextStyle.t3),
                      ),
                    ),     
                    GestureDetector(
                      onTap: (){
                        if(option[0]){
                          showSuccessDialogBox(context, "Item has been order successfully!")
                          .then((value) => Get.offAll(()=>const BottomBar(),transition: Transition.rightToLeft));
                          orderController.setIsOrdered();
                          return;
                        }
                        if(option[1]){
                          showInfoDialogBox(context,"Online payment method coming soon!");
                          return;
                        }
                        showInfoDialogBox(context,"Please select the payment method!");
                      },
                      child: OrderBtn(text1: "Pay Now", text2: "₹ ${orderController.totalPrice}"))
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