import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:megafood/src/controller/userdata_controller.dart';
import 'package:megafood/src/home_page/bottom_navigation.dart';
import 'package:megafood/src/login_register_page/login_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:get/get.dart';

class AuthenticationPage extends StatefulWidget {
  const AuthenticationPage({super.key});

  @override
  State<AuthenticationPage> createState() => _AuthenticationPageState();
}

class _AuthenticationPageState extends State<AuthenticationPage> {

  UserController userController=Get.put(UserController());


  void fetchUserdata(String? uid) async {
    QuerySnapshot<Map<String,dynamic>> fetchData=await FirebaseFirestore.instance.collection("userdata").where('uid',isEqualTo: uid!).limit(1).get();
    Map<String,dynamic> userdata=fetchData.docs.first.data();
    SharedPreferences prefs=await SharedPreferences.getInstance();
    prefs.setString("userdata",json.encode(userdata));
    userController.setValues(jsonEncode(userdata));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(), 
        builder: (context,snapshot){
          if(snapshot.hasData){
            User? currentUser = FirebaseAuth.instance.currentUser;
            fetchUserdata(currentUser?.uid);
            return const BottomBar();
          }else{
            return const LoginPage();
          }
        }),
    );
  }
}