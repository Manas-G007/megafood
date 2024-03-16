import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:megafood/src/menu_page/payment.dart';
import 'package:megafood/src/utils/colors.dart';
import 'package:megafood/src/utils/text_style.dart';
import 'package:megafood/src/widget/back_text.dart';
import 'package:megafood/src/widget/my_line.dart';
import 'package:megafood/src/widget/order_btn.dart';
// import 'package:megafood/src/services/maps.dart';
import 'package:megafood/src/widget/text_time.dart';
import 'package:megafood/src/widgets/empty_input_field.dart';
import 'package:get/get.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  final TextEditingController _senderAddressController = TextEditingController();
  final TextEditingController _recieverAddressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
  return SafeArea(
      child: Scaffold(
        backgroundColor: ThemeColor.c9,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: ThemeColor.c9,
          automaticallyImplyLeading: false,
          title: const BackText(text: "Address"),
        ),
        body: Container(
          // child: getMap(),
        ),
        bottomNavigationBar: Container(
          width: double.maxFinite,
          height: 260,
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
                height: 200,
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
                        height: 130,
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
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            MyBlankField(
                              controller: _senderAddressController, 
                              text: "H-123,Alabama,Ohio",
                              isLocation: true,),
                            const MyLine(width: 1),
                            MyBlankField(
                              controller: _recieverAddressController,
                              text: "H-123,Alabama,Ohio",
                              isLocation: true,
                              isReciever: true,),
                          ],
                        ),
                      ),
                      Gap(15.h),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.w),
                        child: const TextTime(time: "20 Mins"),
                      ),
                  ],
                ),
              ),
              Container(
                height: 60,
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
                    GestureDetector(
                      onTap:(){
                         Get.to(
                            ()=>const PaymentPage(),
                            transition: Transition.rightToLeft
                          );
                      },
                      child: const OrderBtn(text1: "Continue", text2: "₹ 100"))
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