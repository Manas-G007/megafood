import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:megafood/src/controller/order_controller.dart';
import 'package:megafood/src/menu_page/map_page.dart';
import 'package:megafood/src/utils/colors.dart';
import 'package:megafood/src/utils/popups.dart';
import 'package:megafood/src/utils/text_style.dart';
import 'package:megafood/src/widget/back_text.dart';
import 'package:megafood/src/widget/empty_component.dart';
import 'package:megafood/src/widget/item_side_card.dart';
import 'package:megafood/src/widget/order_btn.dart';
import 'package:get/get.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({super.key});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  OrderController orderController=Get.put(OrderController());

  @override
  void initState(){
    super.initState();
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
          title: const BackText(text: "Your Order"),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 0,horizontal: 20),
            child: Column(
              children: [
                SizedBox(
                  child: Obx(()=> orderController.orderData.isEmpty?
                  const EmptyCart():
                   Column(
                      children: List.generate(orderController.orderData.length, (index){
                        final ele=orderController.orderData[index];
                         return ItemSideCard(
                            foodId: ele['foodId'],
                            imgPath: ele['imgUrl'], 
                            heading: ele['name'], 
                            rating: ele['rating'].toStringAsFixed(1), 
                            price: "₹ ${ele['price']}",
                            quantity:ele['quantity']);
                      }),
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
          child:Obx(()=>Row(
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
                    if(orderController.totalItem.value!=0){
                      Get.to(
                        ()=>const MapPage(),
                        transition: Transition.rightToLeft
                      );
                    }else{
                      showInfoDialogBox(context, "This cart is empty :>");
                    }
                  },
                  child: OrderBtn(text1: orderController.totalItem.value!=0?"Next":"Add Item", text2: "₹ ${orderController.totalPrice}"))
              ],
            ),
          )
        ),
      ),
    );
  
  }
}