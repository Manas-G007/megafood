import 'package:get/get.dart';

class UserController extends GetxController{
  final RxString _userData="".obs;
  RxString get userData=>_userData;

  void setValues(var x){
    _userData.value=x;
  }

  void clearValue(){
    _userData.value="";
  }
}