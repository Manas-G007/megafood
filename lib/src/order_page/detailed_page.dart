import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:megafood/src/controller/food_controller.dart';
import 'package:megafood/src/controller/order_controller.dart';
import 'package:megafood/src/utils/colors.dart';
import 'package:megafood/src/utils/snack_bars.dart';
import 'package:megafood/src/utils/text_style.dart';
import 'package:megafood/src/widget/back_text.dart';
import 'package:megafood/src/widget/number_btn.dart';
import 'package:megafood/src/widget/order_btn.dart';
import 'package:megafood/src/widget/read_more.dart';
import 'package:megafood/src/widget/star_text.dart';
import 'package:megafood/src/widget/three_values.dart';
import 'package:megafood/src/widgets/my_rating.dart';
import 'package:megafood/src/widgets/profile_img.dart';
import 'package:get/get.dart';

class DetailedPage extends StatefulWidget {
  final QueryDocumentSnapshot<Map<String,dynamic>> data;
  const DetailedPage({super.key,required this.data});

  @override
  State<DetailedPage> createState() => _DetailedPageState();
}

class _DetailedPageState extends State<DetailedPage> {
  FoodController foodController=Get.put(FoodController());
  OrderController orderController=Get.put(OrderController());
  final TextEditingController _reviewController=TextEditingController();
  
  String rating="5";
  int quantity=1;

  void quantFunc(bool state){
    setState(() {
      if(state){
        if(quantity<20) quantity++;
      }else{
        if(quantity>1) quantity--;
      }
    });
  }


  void handleReviewSubmit() async{
    if(_reviewController.text.trim().isEmpty){
      MySnackBar.errorSnackBar(context, "Please fill the review");
      return;
    }
   await foodController.createNewReview(context, 
    widget.data.id, 
    _reviewController.text.trim(), rating);
    _reviewController.text="";
  }

  void handleAddToCard(){
    orderController.setValues({
      "foodId":widget.data.id,
      "name":widget.data['name'],
      "rating":widget.data['rating'],
      "price":widget.data['price'],
      "imgUrl":widget.data['imgUrl'],
      "quantity":quantity,
      "isPurchased":false
    });

    MySnackBar.successSnackBar(context, "Item Added to Cart!");
  }

  @override
  void initState(){
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ThemeColor.c7,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: ThemeColor.c9,
          automaticallyImplyLeading: false,
          title: BackText(text: "₹ ${widget.data['price'].toString()}"),
        ),
        body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            automaticallyImplyLeading: false,
            pinned: false,
            backgroundColor: ThemeColor.c9,
            expandedHeight: 240.h,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              title: Image.network(widget.data['imgUrl'],
              width: 180),
            ),
          ),
          SliverAppBar(
            pinned: true,
            elevation: 0,
            automaticallyImplyLeading: false,
            backgroundColor: ThemeColor.c7,
            shape:const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(20),
              ),
            ),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(widget.data['name'],style: MyTextStyle.t20),
                Obx(()=> MyRating(
                    rating: foodController.category.where((e)=>e.id == widget.data.id).toList()[0]['rating'].toStringAsFixed(1),
                    isBig: true,),
                )
              ],
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              color:ThemeColor.c7,
              child: Column(
                children: [
                ReadMore(
                  text:widget.data['description'],
                  limit: 150),
                ThreeValue(
                  text1: "${widget.data['time'].toString()} Min", 
                  text2: "${widget.data['distance'].toString()} Km", 
                  text3: "${widget.data['smile'].toString()} Smile"),
                SizedBox(
                  width: double.maxFinite,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Reviews",
                      style: MyTextStyle.t20,),
                      Container(
                        width: double.maxFinite,
                        padding: EdgeInsets.symmetric(horizontal: 15.w),
                        margin: EdgeInsets.symmetric(vertical: 15.h),
                        decoration: BoxDecoration(
                          color:ThemeColor.c1,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow:const [ 
                            BoxShadow(
                              color:ThemeColor.c2,
                              offset: Offset(0, 4),
                              blurRadius: 10
                          )]
                        ),
                        child: TextField(
                          controller:_reviewController,
                          style: MyTextStyle.t6,
                          cursorColor: ThemeColor.c11,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Add review ...",
                            hintStyle:MyTextStyle.t6,
                            suffixIcon: SizedBox(
                              width: 80.w,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Stack(
                                    children: [
                                      StarText(rating: rating),
                                      Positioned(
                                        top: 0,
                                        left: 0,
                                        child:  PopupMenuButton<String>(
                                          icon:const Icon(Icons.abc,
                                          color:Colors.transparent),
                                          offset: const Offset(0, -15),
                                          onSelected: (value) {
                                            // Handle menu item selection
                                            setState(() {
                                              rating=value;
                                            });
                                          },
                                          itemBuilder: (BuildContext context) {
                                            return <PopupMenuEntry<String>>[
                                              const PopupMenuItem<String>(
                                                value: '5',
                                                child: StarText(rating: "5"),
                                              ),
                                              const PopupMenuItem<String>(
                                                value: '4',
                                                child: StarText(rating: "4"),
                                              ),
                                              const PopupMenuItem<String>(
                                                value: '3',
                                                child: StarText(rating: "3"),
                                              ),
                                              const PopupMenuItem<String>(
                                                value: '2',
                                                child: StarText(rating: "2"),
                                              ),
                                              const PopupMenuItem<String>(
                                                value: '1',
                                                child: StarText(rating: "1"),
                                              ),
                                              
                                            ];
                                          },
                                        ),
                                      )
                                    ],
                                  ),
                                  GestureDetector(
                                    onTap:(){
                                      handleReviewSubmit();
                                    },
                                    child: Container(
                                      height: 25.sp,
                                      width: 25.sp,
                                      decoration: BoxDecoration(
                                        color:ThemeColor.c32,
                                        borderRadius: BorderRadius.circular(50)
                                      ),
                                      child:  const Icon(Icons.arrow_forward_outlined,color:ThemeColor.c1)),
                                  )
                                ],
                              ))
                          ),
                          
                        ),
                      )
                    ],
                  ), 
                ),
              ]),
            ),
          ),
         Obx(()=>SliverList(
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                      final ele=foodController.category.where((e)=>e.id == widget.data.id).toList()[0]['review'][index];
                      return Container(
                        color:ThemeColor.c7,
                        padding: EdgeInsets.symmetric(horizontal: 20.w,vertical: 8.h),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ProfileImage(size: 40.sp, imagePath: ele['imgUrl']),
                            Gap(20.w),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(ele['username'],
                                  style: MyTextStyle.t23),
                                  ReadMore(
                                    text: ele['comment'],
                                    limit: 50,
                                    isReview: true,)
                                ],
                              ),
                            )
                          ],
                        ),
                      );
                  },
                  childCount: foodController.category.where((e)=>e.id == widget.data.id).toList()[0]['review'].length,
                ),
              ),
         ),
        ],
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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: ()=>quantFunc(false),
                      child: const NumberBtn(isAdd: false)),
                    Text(quantity.toString(),
                    style: MyTextStyle.t15),
                    GestureDetector(
                      onTap: ()=>quantFunc(true),
                      child: const NumberBtn(isAdd: true)),
                  ],
                ),
              ),              
              GestureDetector(
                onTap:()=>handleAddToCard(),
                child: OrderBtn(text1: "Add to cart", text2: "₹ ${quantity*widget.data['price']}"))
            ],
          )
        ),
      ));
  }
}