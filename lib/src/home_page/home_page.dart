import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:megafood/src/controller/order_controller.dart';
import 'package:megafood/src/controller/userdata_controller.dart';
import 'package:megafood/src/controller/food_controller.dart';
import 'package:megafood/src/menu_page/menu_page.dart';
import 'package:megafood/src/order_page/detailed_page.dart';
import 'package:megafood/src/shimmer/card_1_shimmer.dart';
import 'package:megafood/src/shimmer/card_2_shimmer.dart';
import 'package:megafood/src/shimmer/card_3_shimmer.dart';
import 'package:megafood/src/utils/text_style.dart';
import 'package:megafood/src/widgets/my_big_card.dart';
import 'package:megafood/src/widgets/my_card_1.dart';
import 'package:megafood/src/widgets/my_search_bar.dart';
import 'package:megafood/src/widgets/my_see_all.dart';
import 'package:megafood/src/widgets/my_small_card.dart';
import 'package:megafood/src/widgets/profile_img.dart';
import 'package:get/get.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _searchController=TextEditingController();
  UserController userController=Get.find();
  FoodController foodController=Get.put(FoodController());
  OrderController orderController=Get.put(OrderController());

  @override
  void initState(){
    foodController.fetchCategoryZero(context);
    foodController.fetchCategoryOne(context);
    orderController.getUserOrder();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: 
          Column(
            children: [
              Container(
                width: double.maxFinite,
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    Obx(
                      (){ 
                        var data=userController.userData.value;
                        
                        return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Ahoy, ${data==""?"Loading ...":jsonDecode(data)['name']}",
                              style: MyTextStyle.t5),
                              Text("Welcome to the Ship",
                              style: MyTextStyle.t6)
                            ],
                          ),
                          ProfileImage(size: 50, imagePath: "${data==""?"":jsonDecode(data)['imgLink']}"),
                        ],
                      );
                      }
                    ),
                    Gap(20.h),
                    
                    InkWell(
                      onTap: (){
                        Get.to(()=>const MyMenuPage());
                      },
                      child: MySearchBar(
                        controller: _searchController,
                        isTouch: true,
                        onChange: (){},
                      ),
                    ),
                  ]),
              ),
        
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.symmetric(horizontal: 10.w,vertical: 10.h),
                child:
                Obx((){
                  return foodController.foodData.isNotEmpty?
                  Row(
                  children: List.generate(foodController.foodData.length, (index){
                    final unitFood=foodController.foodData[index];
                    return MyCard1(
                      cardType: index, 
                      text1: unitFood['title'],
                      text2: unitFood['subtitle'],
                      imgPath: unitFood['imgUrl']);
                  }),
                ):Row(
                  children: List.generate(3, (index){
                    return const CardOneShimmer();
                  }),
                );
                }),
              ),
              const MySeeAll(text1: "Discover Food", text2: "See all",showCombo: false),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.symmetric(horizontal: 15.w,vertical: 10.h),
                child: 
                Obx((){
                  return foodController.category.isNotEmpty?
                  Row(
                  children: List.generate(foodController.category.length, (index){
                    final unitFood=foodController.category[index];
                    return !unitFood['isCombo']? 
                    GestureDetector(
                      onTap: (){
                        Get.to(()=>DetailedPage(data: unitFood),
                        transition: Transition.downToUp);
                      },
                      child: MySmallCard(
                        text: unitFood['name'],
                        imgPath: unitFood['imgUrl']),
                    ):const Text("");
                  }),
                ):Row(
                  children: List.generate(3, (index){
                    return const CardTwoShimmer();
                  }),
                );
                })
              ),
              const MySeeAll(text1: "Good Food nearby", text2: "See all",showCombo: true),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.symmetric(horizontal: 15.w,vertical: 10.h),
                child:Obx((){
                return foodController.category.isNotEmpty?
                 Row(
                  children:List.generate(foodController.category.length, (index){
                    final unitFood=foodController.category[index];
                     return unitFood['isCombo']? 
                     GestureDetector(
                       onTap: (){
                        Get.to(()=>DetailedPage(data: unitFood),
                        transition: Transition.downToUp);
                      },
                       child: MyBigCard(
                        heading: unitFood['name'],
                        imgPath: unitFood['imgUrl'],
                        distanceVal: unitFood['distance'].toString(),
                        rating:unitFood['rating'].toString(),
                        timeVal: unitFood['time'].toString(),
                        smileVal: unitFood['smile'].toString(),
                        ),
                     ):const Text("");
                  })
                ):Row(
                  children: List.generate(3, (index){
                    return const CardThreeShimmer();
                  }),
                );
                }
                ),
              ),
            ],
          ),
        ),
      ));
  }
}