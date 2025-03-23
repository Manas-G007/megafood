import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:megafood/src/controller/order_controller.dart';
import 'package:megafood/src/utils/colors.dart';
import 'package:megafood/src/utils/text_style.dart';
import 'package:megafood/src/widget/number_btn.dart';
import 'package:megafood/src/widget/text_rating.dart';
import 'package:get/get.dart';

class ItemSideCard extends StatefulWidget {
  final String foodId;
  final String imgPath;
  final String heading;
  final String rating;
  final String price;
  final int quantity;
  const ItemSideCard({super.key,
  required this.foodId,
  required this.imgPath,
  required this.heading,
  required this.rating,
  required this.price,
  required this.quantity});

  @override
  State<ItemSideCard> createState() => _ItemSideCardState();
}

class _ItemSideCardState extends State<ItemSideCard> {
  OrderController orderController=Get.put(OrderController());
  int quantity=1;

  void quantFunc(bool state){
    setState(() {
      if(state){
        if(quantity<20){
          quantity++;
          orderController.updateQuantity(widget.foodId,quantity);
        }
      }else{
        if(quantity==1){
          orderController.clearValue(widget.foodId);
        }else{
          quantity--;
          orderController.updateQuantity(widget.foodId,quantity);
        }
      }
    });
  }

  @override
  void initState(){
    setState(() {
      if(mounted){
        quantity=widget.quantity;
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
              height: 110,
              width: double.maxFinite,
              margin: EdgeInsets.symmetric(vertical: 5.h),
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                color:ThemeColor.c1,
                borderRadius: BorderRadius.circular(10),
                boxShadow:const [ 
                BoxShadow(
                  color:ThemeColor.c2,
                  offset: Offset(0, 4),
                  blurRadius: 10
                )],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left:12.w),
                    child: Image.network(widget.imgPath,
                    width: 100.w),
                  ),
                  Container(
                    width: 210.w,
                    height: double.maxFinite,
                    padding: EdgeInsets.symmetric(horizontal: 20.w,vertical: 15.h),
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors:[
                          ThemeColor.c4,
                          ThemeColor.c5
                        ]
                      ),
                      borderRadius: BorderRadius.circular(10)
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextRating(heading:widget.heading, rating: widget.rating),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(widget.price,
                            style: MyTextStyle.t14,),
                            SizedBox(
                              width: 75.w,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  GestureDetector(
                                    onTap:()=>quantFunc(false),
                                    child: const NumberBtn(isAdd: false,isSmall: true)),
                                  Text(quantity.toString(),
                                  style: MyTextStyle.t9),
                                  GestureDetector(
                                    onTap:()=>quantFunc(true),
                                    child: const NumberBtn(isAdd: true,isSmall: true)),
                                ],),
                            ),
                          ],
                        )
                      ],
                    ),
                  )]
                  )
                  );
  }
}