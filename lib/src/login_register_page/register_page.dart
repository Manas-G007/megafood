import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:megafood/src/authentication/authentication.dart';
import 'package:megafood/src/login_register_page/login_page.dart';
import 'package:megafood/src/utils/colors.dart';
import 'package:megafood/src/utils/snack_bars.dart';
import 'package:megafood/src/utils/text_style.dart';
import 'package:megafood/src/widgets/my_btn.dart';
import 'package:megafood/src/widgets/my_input.dart';
import 'package:get/get.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _fullnameController=TextEditingController();
  final TextEditingController _emailController=TextEditingController();
  final TextEditingController _passwordController=TextEditingController();
  final TextEditingController _confirmPasswordController=TextEditingController();

  bool loading=false;

  void toggleLoading(){
    setState(() {
      loading=!loading;
    });
  }

  void registerUser() async {

    if(
      _fullnameController.text.isEmpty ||
      _emailController.text.isEmpty ||
      _passwordController.text.isEmpty ||
      _confirmPasswordController.text.isEmpty 
    ){
      MySnackBar.errorSnackBar(context, "Fill out the fields");
      return;
    }

    if(!_emailController.text.isEmail){
      MySnackBar.errorSnackBar(context, "Enter valid Email");
      return;
    }

    if(_passwordController.text.length<8){
      MySnackBar.errorSnackBar(context, "Password should be 8 characters long");
      return;
    }

    if(_passwordController.text!=_confirmPasswordController.text){
      MySnackBar.errorSnackBar(context, "Password doesn't match");
      return;
    }

    try{
      toggleLoading();
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailController.text, 
        password: _passwordController.text);

      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text, 
        password: _passwordController.text);

      await FirebaseFirestore.instance.collection("userdata").add(
        {
          "uid":FirebaseAuth.instance.currentUser?.uid,
          "name":_fullnameController.text,
          "email":_emailController.text,
          "imgLink":"",
          "phone":0,
          "address":""
        }
      );

      if(mounted){
        toggleLoading();
        MySnackBar.successSnackBar(context, "Account Created Successfully !!");
        Get.to(()=>const AuthenticationPage());
      }
    }on FirebaseAuthException catch(e){
      if(mounted){
        toggleLoading();
        if(e.code=='email-already-in-use'){
          MySnackBar.errorSnackBar(context, "Email already in use !");
        }else{
          MySnackBar.errorSnackBar(context, "Something Went Wrong !!");
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    // final Size ss= MediaQuery.of(context).size;
    // print(ss);
    return Scaffold(
      backgroundColor: ThemeColor.c9,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Stack(
            children: [
              Positioned(
                right:-160,
                bottom: 0,
                child: Hero(
                  tag:"circle1",
                  child: Container(
                    width: 490.w,
                    height: 490.w,
                    decoration: BoxDecoration(
                      color:ThemeColor.c6,
                      borderRadius: BorderRadius.circular(500)
                        .copyWith(
                          bottomRight: const Radius.circular(0),
                          bottomLeft: const Radius.circular(0),)
                    ),
                  ),
                ),
              ),
              Positioned(
                left:-190,
                bottom: -30,
                child: Hero(
                  tag:"circle2",
                  child: Container(
                    width: 550.w,
                    height: 550.w,
                    decoration: BoxDecoration(
                      color:ThemeColor.c7,
                      borderRadius: BorderRadius.circular(500).copyWith(bottomLeft: const Radius.circular(0))
                    ),
                  ),
                ),
              ),
              Container(
              width:double.maxFinite,
              padding: EdgeInsets.symmetric(
                horizontal: 20.w,
                vertical: 30.h),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Gap(50.h),
                  Hero(
                    tag:"main_logo",
                    child: Image.asset("assets/images/megafood_logo.png",
                    width:300.w),
                  ),
                  MyInput(
                    controller: _fullnameController,
                    hint: "Full Name", 
                    icon:const Icon(Icons.face),
                    isPassword: false),
                  MyInput(
                    controller: _emailController,
                    hint: "Email", 
                    icon:const Icon(Icons.email),
                    isPassword: false),
                  MyInput(
                    controller: _passwordController, 
                    hint: "Password", 
                    isPassword: true),
                  MyInput(
                    controller: _confirmPasswordController, 
                    hint: "Confirm Password", 
                    isPassword: true),
                  Gap(20.h),
                  GestureDetector(
                    onTap:registerUser,
                    child: MyBtn(text: "Register", isLoading: loading)),
                  Gap(30.h),
                  GestureDetector(
                    onTap:() {
                      Get.to(()=>const LoginPage(),
                      transition: Transition.noTransition);
                    },
                    child: Text("Have an account ? Sign In",
                    style: MyTextStyle.t2
                    ),
                  ),
                  Gap(15.h)
                ],
              ),
                          )],
          ),
      ),
      );
  }
}