import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:megafood/src/utils/snack_bars.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FoodController extends GetxController{
  final RxList _foodData=[].obs;
  RxList get foodData=>_foodData;

  final RxList _category=[].obs;
  RxList get category=>_category;

  final _firebaseFirestore=FirebaseFirestore.instance;

  void fetchCategoryZero(context) async {
    try{
       QuerySnapshot<Map<String,dynamic>> fetchData=await _firebaseFirestore
        .collection("food")
        .doc("T2BYf0LkhILrk0rPRZv7")
        .collection('categories').get();
        _foodData.value=fetchData.docs;
    }catch(e){
      MySnackBar.errorSnackBar(context, "something went wrong!");
    }
  }
  void fetchCategoryOne(context) async {
    try{
       QuerySnapshot<Map<String,dynamic>> fetchData=await _firebaseFirestore
        .collection("food")
        .doc("T2BYf0LkhILrk0rPRZv7")
        .collection('categories_one').get();
        _category.value=fetchData.docs;
    }catch(e){
      MySnackBar.errorSnackBar(context, "something went wrong!");
    }
  }
  Future<void> createNewReview(context,foodId,comment,rating) async {
    try{
      SharedPreferences prefs=await SharedPreferences.getInstance();
      Map<dynamic,dynamic> userdata=jsonDecode(prefs.getString('userdata')!);

      // adding new review
      await _firebaseFirestore
        .collection("food")
        .doc("T2BYf0LkhILrk0rPRZv7")
        .collection('categories_one')
        .doc(foodId) 
        .update({
          'review': FieldValue.arrayUnion([{
            "uid":userdata['uid'],
            "imgUrl":userdata['imgLink'],
            "username":userdata['name'],
            "comment":comment,
            "rating":rating
          }])
        });
      
      // calculating avg rating
      final prevRating=category.where((e)=>e.id == foodId).toList()[0]['rating'];
      final prevLength=category.where((e)=>e.id == foodId).toList()[0]['review'].length;
      double newRating=(prevRating+int.parse(rating))/prevLength+1;

      await _firebaseFirestore
      .collection("food")
      .doc("T2BYf0LkhILrk0rPRZv7")
      .collection('categories_one')
      .doc(foodId) 
      .update({
        'rating': newRating
      });

      fetchCategoryOne(context);
      MySnackBar.successSnackBar(context, "Review Added Successfully!");
    }catch(e){
      MySnackBar.errorSnackBar(context, "something went wrong!");
    }
  }
}