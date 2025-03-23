import 'package:flutter/material.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import 'package:audioplayers/audioplayers.dart';



class MySnackBar{
  static void successSnackBar(context,String message){
    final player=AudioPlayer();
    player.play(AssetSource("audio/success_sound.mp3"));
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
    final player=AudioPlayer();
    player.play(AssetSource("audio/error_sound.mp3"));
     showTopSnackBar(
        Overlay.of(context),
        CustomSnackBar.error(message: message)
      );
  }
}