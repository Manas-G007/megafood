import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:megafood/src/authentication/authentication.dart';
import 'package:megafood/src/login_register_page/register_page.dart';
import 'package:megafood/src/utils/snack_bars.dart';
import 'package:megafood/src/utils/colors.dart';
import 'package:megafood/src/utils/text_style.dart';
import 'package:megafood/src/widgets/my_btn.dart';
import 'package:megafood/src/widgets/my_input.dart';
import 'package:get/get.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController=TextEditingController();
  final TextEditingController _passwordController=TextEditingController();

  bool loading=false;

  void toggleLoading(){
    setState(() {
      loading=!loading;
    });
  }

  void loginUser() async{
    if(
      _emailController.text.isEmpty ||
      _passwordController.text.isEmpty
    ){
      MySnackBar.errorSnackBar(context, "Fill out the email and password");
      return;
    }

    if(!_emailController.text.isEmail){
      MySnackBar.errorSnackBar(context, "Enter Valid Email");
      return;
    }    

    try{
      toggleLoading();
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text, 
        password: _passwordController.text);
      if(mounted){
        toggleLoading();
        MySnackBar.successSnackBar(context, "Logged In Successful");
        Get.to(()=>const AuthenticationPage());
      }
    }on FirebaseAuthException catch(e){
      if(mounted){
        toggleLoading();
        if(e.code=='invalid-credential'){
          MySnackBar.errorSnackBar(context, "Invalid Credential");
        }else{
          MySnackBar.errorSnackBar(context, "Something Went Wrong!!");
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    // final Size ss= MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: ThemeColor.c9,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Positioned(
              left:-120,
              bottom: -70,
              child: Hero(
                tag:"circle1",
                child: Container(
                  width: 450.w,
                  height: 450.w,
                  decoration: BoxDecoration(
                    color:ThemeColor.c6,
                    borderRadius: BorderRadius.circular(250)
                  ),
                ),
              ),
            ),
            Positioned(
              right:-190,
              bottom: -90,
              child: Hero(
                tag:"circle2",
                child: Container(
                  width: 520.w,
                  height: 520.w,
                  decoration: BoxDecoration(
                    color:ThemeColor.c7,
                    borderRadius: BorderRadius.circular(500)
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
                Gap(140.h),
                Hero(
                    tag:"main_logo",
                    child: Image.asset("assets/images/megafood_logo.png",
                    width:300.w),
                  ),
                Gap(40.h),
                Column(
                    children: [
                      MyInput(
                        controller: _emailController,
                        hint: "Email", 
                        icon:const Icon(Icons.email),
                        isPassword: false),
                      MyInput(
                        controller: _passwordController, 
                        hint: "Password", 
                        isPassword: true),
                      SizedBox(
                        width: double.maxFinite,
                        child: Text("forgot password ?",
                        textAlign: TextAlign.right,
                        style: MyTextStyle.t2),
                        ),
                      Gap(20.h),
                      GestureDetector(
                        onTap: loginUser,
                        child: MyBtn(text: "Login", isLoading: loading)),
                      Gap(30.h),
                      GestureDetector(
                      onTap: (){
                      Get.to(()=>const RegisterPage(),
                        transition: Transition.noTransition);
                      },
                      child: Text("Create new account ? Sign Up",
                      style: MyTextStyle.t2
                      ),
                      ),
                      Gap(15.h),
                    ]
                  ),
               
              ],
            ),
                    )],
        ),
      )
    );
  }
}