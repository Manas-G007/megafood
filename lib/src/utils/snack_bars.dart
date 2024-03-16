import 'package:flutter/material.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class MySnackBar{
  static void successSnackBar(context,String message){
     showTopSnackBar(
        Overlay.of(context),
        CustomSnackBar.success(message: message)
      );
  }
  static void infoSnackBar(context,String message){
     showTopSnackBar(
        Overlay.of(context),
        CustomSnackBar.info(message: message)
      );
  }
  static void errorSnackBar(context,String message){
     showTopSnackBar(
        Overlay.of(context),
        CustomSnackBar.error(message: message)
      );
  }
}