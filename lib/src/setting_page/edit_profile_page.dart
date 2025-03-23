import 'dart:convert';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:image_picker/image_picker.dart';
import 'package:megafood/src/controller/userdata_controller.dart';
import 'package:megafood/src/services/image_upload.dart';
import 'package:megafood/src/utils/colors.dart';
import 'package:megafood/src/utils/snack_bars.dart';
import 'package:megafood/src/utils/text_style.dart';
import 'package:megafood/src/widget/my_line.dart';
import 'package:megafood/src/widgets/empty_input_field.dart';
import 'package:megafood/src/widgets/my_back_btn.dart';
import 'package:megafood/src/widgets/my_btn.dart';
import 'package:get/get.dart';
import 'package:megafood/src/widgets/profile_img.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyEditPage extends StatefulWidget {
  const MyEditPage({super.key});

  @override
  State<MyEditPage> createState() => _MyEditPageState();
}

class _MyEditPageState extends State<MyEditPage> {

  UserController userController=Get.put(UserController());

  final TextEditingController _nameController=TextEditingController();
  final TextEditingController _phoneController=TextEditingController();
  final TextEditingController _addressController=TextEditingController();
  String _imgLink="";
  String _uid="";
  bool loading=false;
  File? image;

  Future pickImage() async {
    try{
      final pickedImage=await ImagePicker().pickImage(source: ImageSource.gallery);
      if(pickedImage==null){
        if(mounted){
          MySnackBar.errorSnackBar(context, "No file was picked");
        }
        return;
      }
      if(mounted){
        String link=await ImageUpload.uploadIt(context,File(pickedImage.path), _uid);

        if(link!=""){
          Map<String,dynamic> updateData={
          "uid":_uid,
          "name":_nameController.text,
          "phone":int.parse(_phoneController.text==""?"0":_phoneController.text),
          "address":_addressController.text,
          "imgLink":link
          };

          SharedPreferences prefs=await SharedPreferences.getInstance();
          prefs.setString("userdata",json.encode(updateData));
          userController.setValues(jsonEncode(updateData));

          setState(() {
            _imgLink=link;
          });
        }
        
      }
    } on PlatformException catch(e) {
      if(mounted){
        MySnackBar.errorSnackBar(context, "unable to pick image : $e");
      }
    }
  }
  
  void toggleLoading(){
    setState(() {
      loading=!loading;
    });
  }

  Future fetchData() async {
    SharedPreferences prefs=await SharedPreferences.getInstance();
    if(mounted){
      setState(() {
        Map<dynamic,dynamic> userdata=jsonDecode(prefs.getString('userdata')!);
        // print(userdata);
        _nameController.text=userdata['name'];
        _phoneController.text=userdata['phone']==0?"":userdata['phone'].toString();
        _addressController.text=userdata['address'];    
        _imgLink=userdata['imgLink']; 
        _uid=userdata['uid'];   
      });
    }
  }

  void updateProfile() async{
    
    Map<String,dynamic> updateData={
      "uid":_uid,
      "name":_nameController.text,
      "phone":int.parse(_phoneController.text==""?"0":_phoneController.text),
      "address":_addressController.text,
      "imgLink":_imgLink
    };

    try{
      toggleLoading();
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection("userdata")
        .where('uid',isEqualTo: _uid)
        .get();

      DocumentReference userRef=querySnapshot.docs.first.reference;
      await userRef.update(updateData);
      SharedPreferences prefs=await SharedPreferences.getInstance();
      prefs.setString("userdata",json.encode(updateData));
      userController.setValues(jsonEncode(updateData));
      if(mounted){
        toggleLoading();
        MySnackBar.successSnackBar(context, "profile updated successfully!!");
      }
    }catch(e){
      if(mounted){
        toggleLoading();
        MySnackBar.errorSnackBar(context, "somethign went wrong!!");
      }
    }

   
  }
 
  @override
  void initState() {
    fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ThemeColor.c9,
        appBar: AppBar(
          backgroundColor: ThemeColor.c9,
          elevation: 0,
          automaticallyImplyLeading: false,
          title:  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap:(){
                          Get.back();
                        },
                        child: const MyBackBtn()),
                      Text("Discover new taste",
                      style: MyTextStyle.t6,)
                    ],
                  ),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
            Gap(40.h),
            Center(
              child: Stack(
                children: [
                  ProfileImage(size: 120, imagePath: _imgLink),
                  Positioned(
                    bottom:0,
                    right: 0,
                    child: GestureDetector(
                      onTap: pickImage,
                      child: Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                          color:ThemeColor.c11,
                          borderRadius: BorderRadius.circular(100)
                        ),
                        child: Center(
                          child: Icon(Icons.edit,
                          color:ThemeColor.c1,
                          size: 18.sp),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              width: double.maxFinite,
              height: 610.h,
              margin: EdgeInsets.only(top:40.h),
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                color:ThemeColor.c7,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20)
                )
              ),
              child: Column(
                children: [
                  Container(
                    width: double.maxFinite,
                    height: 210.h,
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    decoration: BoxDecoration(
                      color:ThemeColor.c1,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow:const [ 
                          BoxShadow(
                            color:ThemeColor.c2,
                            offset: Offset(0, 5),
                            blurRadius: 15
                          )],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MyBlankField(
                          controller: _nameController, 
                          text: "Full name"),
                        const MyLine(width: 1),
                        MyBlankField(
                          controller: _phoneController,
                          text: "Phone"),
                        const MyLine(width: 1),
                        MyBlankField(
                          controller: _addressController, 
                          text: "Address")
                      ],
                    ),
                  ),
                  Gap(30.h),
                  GestureDetector(
                    onTap:updateProfile,
                    child: MyBtn(text: "Save Profile", isLoading: loading))
                ],
              ),
            )
          ]),
        ),
      )
    );
  }
}