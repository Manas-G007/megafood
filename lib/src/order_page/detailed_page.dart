import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:megafood/src/utils/colors.dart';
import 'package:megafood/src/utils/text_style.dart';
import 'package:megafood/src/widget/back_text.dart';
import 'package:megafood/src/widget/number_btn.dart';
import 'package:megafood/src/widget/order_btn.dart';
import 'package:megafood/src/widget/read_more.dart';
import 'package:megafood/src/widget/star_text.dart';
import 'package:megafood/src/widget/three_values.dart';
import 'package:megafood/src/widgets/my_rating.dart';
import 'package:megafood/src/widgets/profile_img.dart';

class DetailedPage extends StatefulWidget {
  final QueryDocumentSnapshot<Map<String,dynamic>> data;
  const DetailedPage({super.key,required this.data});

  @override
  State<DetailedPage> createState() => _DetailedPageState();
}

class _DetailedPageState extends State<DetailedPage> {
  final TextEditingController _reviewController=TextEditingController();
  String rating="5";
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
                MyRating(
                  rating: widget.data['rating'].toString(),
                  isBig: true,)
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
                                  Container(
                                    height: 25.sp,
                                    width: 25.sp,
                                    decoration: BoxDecoration(
                                      color:ThemeColor.c32,
                                      borderRadius: BorderRadius.circular(50)
                                    ),
                                    child: const Icon(Icons.arrow_forward_outlined,color:ThemeColor.c1))
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
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Container(
                  color:ThemeColor.c7,
                  padding: EdgeInsets.symmetric(horizontal: 20.w,vertical: 8.h),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ProfileImage(size: 40.sp, imagePath: "assets/images/pic1.png"),
                      Gap(20.w),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Username",
                            style: MyTextStyle.t23),
                            const ReadMore(
                              text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla nec dolor risus. Nulla nec dolor risus. Nulla nec dolor risus.",
                              limit: 50,
                              isReview: true,)
                          ],
                        ),
                      )
                    ],
                  ),
                );
              },
              childCount: 10,
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
                    const NumberBtn(isAdd: false),
                    Text("1",
                    style: MyTextStyle.t15),
                    const NumberBtn(isAdd: true),
                  ],
                ),
              ),              
              const OrderBtn(text1: "Add to cart", text2: "₹ 100")
            ],
          )
        ),
      ));
  }
}