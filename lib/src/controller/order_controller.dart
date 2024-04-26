import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OrderController extends GetxController{
  final RxList _orderData=[].obs;
  RxList get orderData=>_orderData;
  final RxInt _totalPrice=0.obs;
  RxInt get totalPrice=>_totalPrice;
  final RxInt _totalItem=0.obs;
  RxInt get totalItem=>_totalItem;
  final RxBool _isOrdered=false.obs;
  RxBool get isOrdered=>_isOrdered;

  final _firebaseFirestore=FirebaseFirestore.instance;

  void setValues(var x){
    int index = _orderData.indexWhere((item) => item['foodId'] == x["foodId"]);

    if(index!=-1){
      int newQuantity=_orderData[index]['quantity']+x['quantity'];
      _orderData[index]["quantity"]=newQuantity>20?20:newQuantity;
    }else{
      _orderData.add(x);
    }

    updatePrice();
  }

  void clearValue(var id){
    _orderData.removeWhere((ele) => ele['foodId']==id);
    
    updatePrice();
  }

  void updateQuantity(var id,int newQuantity){
    int index = _orderData.indexWhere((item) => item['foodId'] == id);
    _orderData[index]["quantity"]=newQuantity;

    updatePrice();
  }

  void updatePrice(){
    int sumOfPrice = 0;
    for (var item in _orderData) {
      int price = int.tryParse(item['price'].toString()) ?? 0;
      int quantity = int.tryParse(item['quantity'].toString()) ?? 0;
      sumOfPrice += price * quantity;
    }
    _totalPrice.value=sumOfPrice;
    int sumOfItem = 0;
    for (var item in _orderData) {
      int quantity = int.tryParse(item['quantity'].toString()) ?? 0;
      sumOfItem += quantity;
    }
    _totalItem.value=sumOfItem;

    addOrderToUser();
  }

  void addOrderToUser() async{
    SharedPreferences prefs=await SharedPreferences.getInstance();
    Map<dynamic,dynamic> userdata=jsonDecode(prefs.getString('userdata')!);

    try{
      QuerySnapshot fetchId=await _firebaseFirestore
        .collection("userdata")
        .where("uid",isEqualTo:userdata["uid"])
        .get();
      
      final uid=fetchId.docs[0].id;

      await _firebaseFirestore
      .collection("userdata")
      .doc(uid)
      .update({
        "userOrder":_orderData
      });
        
    }catch(e){
      // print(e);
    }
  }

  void getUserOrder() async{
    SharedPreferences prefs=await SharedPreferences.getInstance();
    Map<dynamic,dynamic> userdata=jsonDecode(prefs.getString('userdata')!);

    try{
      QuerySnapshot fetchId=await _firebaseFirestore
        .collection("userdata")
        .where("uid",isEqualTo:userdata["uid"])
        .get();
      
      final uid=fetchId.docs[0].id;

      DocumentSnapshot fetchData=await _firebaseFirestore
      .collection("userdata")
      .doc(uid)
      .get();

      _orderData.value=fetchData['userOrder'];
      updatePrice();
        
    }catch(e){
      // print(e);
    }
  }

  void setIsOrdered(){
    _isOrdered.value=true;
  }
}