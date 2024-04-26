import 'package:get/get.dart';

class ThemeController extends GetxController{
  final RxBool _theme=false.obs;
  RxBool get theme=>_theme;

  final RxList _themeList=[].obs;
  RxList get themeList=>_themeList;

  void getTheme(){
    _themeList.value=[
      {
        "name":"Orange",
        "imgLink":"assets/images/orange.png"
      },
      {
        "name":"Ice Blue",
        "imgLink":"assets/images/iceblue.png"
      },
      {
        "name":"MoonLight",
        "imgLink":"assets/images/moonlight.png"
      }
    ];
  }

  void setValues(var x){
    _theme.value=x;
  }

  void clearValue(){
    _theme.value=false;
  }
}