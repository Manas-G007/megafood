import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:megafood/src/controller/food_controller.dart';
import 'package:megafood/src/order_page/detailed_page.dart';
import 'package:megafood/src/utils/colors.dart';
import 'package:megafood/src/widget/back_text.dart';
import 'package:megafood/src/widgets/my_search_bar.dart';
import 'package:megafood/src/widgets/my_side_card.dart';
import 'package:get/get.dart';

class MyMenuPage extends StatefulWidget {
  const MyMenuPage({super.key});

  @override
  State<MyMenuPage> createState() => _MyMenuPageState();
}

class _MyMenuPageState extends State<MyMenuPage> {
  final TextEditingController _searchController=TextEditingController();
  FoodController foodController=Get.put(FoodController());
  var allItem=[];
  
  void resetItem(){
    setState(() {
      if(mounted){
        allItem=foodController.category;
      }
    });
  }

  void searchFilter(e){
    allItem=[];
    if(e!=""){
      setState(() {
        if(mounted){
           for(var item in foodController.category){
            if(item['name'].toLowerCase().contains(e)){
              allItem.add(item);
            }
          }
        }
      });
    }else{
      resetItem();
    }
  }

  @override
  void initState(){
    resetItem();
    super.initState();
  }

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
                    onChange: (e)=>searchFilter(e.toLowerCase().trim()),
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
                    children: List.generate(allItem.length, (index){
                      final unitFood=allItem[index];
                      return GestureDetector(
                        onTap: (){
                          Get.to(()=>DetailedPage(data: unitFood));
                        },
                        child: MySideCard(
                            imgPath: unitFood['imgUrl'],
                            heading: unitFood['name'],
                            rating: unitFood['rating'].toStringAsFixed(1),
                            timeVal: "${unitFood['time']} Min",
                            distanceVal: "${unitFood['distance']} Km",
                            smileVal: "${unitFood['smile']} Smile",
                          ),
                      );
                      }
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