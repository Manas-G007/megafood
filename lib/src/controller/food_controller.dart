import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:megafood/src/utils/snack_bars.dart';

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
      MySnackBar.errorSnackBar(context, "something went wrong");
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
      MySnackBar.errorSnackBar(context, "something went wrong");
    }
  }
}