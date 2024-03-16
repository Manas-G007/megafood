import 'package:flutter/material.dart';
import 'package:megafood/src/utils/colors.dart';
import 'package:megafood/src/utils/text_style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyInput extends StatefulWidget {
  
  final String hint;
  final TextEditingController controller;
  final bool isPassword;
  final Icon? icon;

  const MyInput({super.key,
  required this.controller,
  required this.hint,
  this.icon,
  required this.isPassword});

  @override
  State<MyInput> createState() => _MyInputState();
}

class _MyInputState extends State<MyInput> {
  bool isVisible=true;
  Icon hideEye=const Icon(Icons.visibility_off);
  Icon showEye=const Icon(Icons.visibility);
  
  void toggleView(){
    setState(() {
      isVisible=!isVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
   
    return Container(
                margin: EdgeInsets.symmetric(vertical: 10.h),
                padding: EdgeInsets.symmetric(horizontal: 10.w,vertical: 5.h),
                decoration: BoxDecoration(
                   color:ThemeColor.c1,
                   borderRadius: BorderRadius.circular(10.0),
                   boxShadow:const [ 
                    BoxShadow(
                      color:ThemeColor.c2,
                      offset: Offset(0, 4),
                      blurRadius: 10
                   )]
                ),
                child: TextField(
                  controller: widget.controller,
                  style: MyTextStyle.t1,
                  obscureText: widget.isPassword?isVisible:false,
                  cursorColor: ThemeColor.c11,
                  decoration: InputDecoration(
                    prefixIcon: Padding(padding: const EdgeInsets.all(0),
                    child: widget.icon??
                    GestureDetector(
                      onTap: (){
                        if(widget.isPassword){
                          toggleView();
                        }
                      },
                      child: isVisible?
                        hideEye:
                        showEye,
                    )),
                    prefixIconColor: ThemeColor.c3,
                    border: InputBorder.none,
                    hintText:widget.hint,
                    hintStyle: MyTextStyle.t1
                  ),
                ),
              );
  }
}