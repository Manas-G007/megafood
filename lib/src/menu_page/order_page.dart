import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:megafood/src/menu_page/map_page.dart';
import 'package:megafood/src/utils/colors.dart';
import 'package:megafood/src/utils/text_style.dart';
import 'package:megafood/src/widget/back_text.dart';
import 'package:megafood/src/widget/item_side_card.dart';
import 'package:megafood/src/widget/order_btn.dart';
import 'package:get/get.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({super.key});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ThemeColor.c9,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: ThemeColor.c9,
          automaticallyImplyLeading: false,
          title: const BackText(text: "Your Order"),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 0,horizontal: 20),
            child: Column(
              children: [
                SizedBox(
                  child: Column(
                    children: List.generate(5, (index) =>
                        const ItemSideCard(
                          imgPath: "assets/images/food1.png", 
                          heading: "heading", 
                          rating: "4.5", 
                          price: "₹ 100")
                    ),
                  ),
                )      
              ],
            ),
          ),
        ),
        bottomNavigationBar: Container(
          width: double.maxFinite,
          height: 60,
          padding: EdgeInsets.symmetric(horizontal: 15.w,vertical: 10.h),
          decoration:const BoxDecoration(
            gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors:[
                      ThemeColor.c4,
                      ThemeColor.c5
                    ]
                  )
          ),
          child:Row(
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
                onTap: (){
                  Get.to(
                    ()=>const MapPage(),
                    transition: Transition.rightToLeft
                  );
                },
                child: const OrderBtn(text1: "Add to cart", text2: "₹ 100"))
            ],
          )
        ),
      ),
    );
  
  }
}