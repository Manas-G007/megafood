import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:megafood/src/controller/food_controller.dart';
import 'package:megafood/src/order_page/detailed_page.dart';
import 'package:megafood/src/utils/colors.dart';
import 'package:megafood/src/widget/back_text.dart';
import 'package:megafood/src/widget/rating_img_text.dart';
import 'package:megafood/src/widgets/my_search_bar.dart';
import 'package:get/get.dart';

class MySeeAllPage extends StatefulWidget {
  final bool showCombo;
  const MySeeAllPage({super.key,
  required this.showCombo});

  @override
  State<MySeeAllPage> createState() => _MySeeAllPageState();
}

class _MySeeAllPageState extends State<MySeeAllPage> {
  final TextEditingController _searchController=TextEditingController();
  FoodController foodController=Get.put(FoodController());
  var listOfCombo=[];
  var listOfNonCombo=[];

  void filterContent(){
    setState(() {
      if(mounted){
        for (var item in foodController.category){
          if(item["isCombo"]){
            listOfCombo.add(item);
          }
          if(!item["isCombo"]){
            listOfNonCombo.add(item);
          }
        }
      }
    });
    
  }

  void searchFilter(e){    
    listOfCombo=[];
    listOfNonCombo=[];
    if(e!=""){
      setState(() {
        if(mounted){
           for(var item in foodController.category){
            if(item['name'].toLowerCase().contains(e)){
                if(item["isCombo"]){
                  listOfCombo.add(item);
                }
                if(!item["isCombo"]){
                  listOfNonCombo.add(item);
                }
              }
            }
        }
      });
    }else{
      filterContent();
    }
  }

  @override
  void initState(){
    filterContent();
    foodController.fetchCategoryZero(context);
    foodController.fetchCategoryOne(context);
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
            padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 20),
            child: Column(
              children: [
                SizedBox(
                  height: 670.h,
                  width: double.maxFinite,
                  child:  Expanded(
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        mainAxisExtent: 200.h,
                        mainAxisSpacing: 30,
                        crossAxisSpacing: 30,
                        crossAxisCount: 2), 
                      itemCount: widget.showCombo?listOfCombo.length:listOfNonCombo.length,
                      itemBuilder: (BuildContext context, index){
                        final unitFood=widget.showCombo?listOfCombo[index]:listOfNonCombo[index];
                        return GestureDetector(
                          onTap:(){
                            Get.to(()=>DetailedPage(data: unitFood));
                          },
                          child: MyRatingImgText(
                                rating: unitFood["rating"]?.toStringAsFixed(1), 
                                imgUrl: unitFood["imgUrl"], 
                                text: unitFood["name"]),
                        );
                        } 
                      )
                  )
                )      
              ],
            ),
          ),
        ),
      )
      );
  }
}