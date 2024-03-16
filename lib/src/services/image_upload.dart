import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:megafood/src/utils/colors.dart';
import 'package:megafood/src/utils/snack_bars.dart';
import 'package:sn_progress_dialog/sn_progress_dialog.dart';


class ImageUpload{
  static Future<String> uploadIt(context,File imageFile,String uid) async {
    ProgressDialog pd = ProgressDialog(context: context);

    try{
      Reference storageRef=FirebaseStorage.instance
            .ref().child("profiles/$uid.png");

      UploadTask uploadTask = storageRef.putFile(imageFile);

      pd.show(
        max: 100, 
        backgroundColor: ThemeColor.c11,
        msgColor: ThemeColor.c1,
        msg: 'Uploading Image 0',
        hideValue: true,
        progressBgColor: ThemeColor.c1,
        progressValueColor: ThemeColor.c30
        );
      uploadTask.snapshotEvents.listen((TaskSnapshot snapshot) {
        double progress = (snapshot.bytesTransferred / snapshot.totalBytes) * 100;
        pd.update(value: progress.toInt(),msg: "Uploading Image ${progress.toInt()}%"); 

      });

      await uploadTask;

      String downloadUrl=await storageRef.getDownloadURL();

      // updating latest imgUrl to current user
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection("userdata")
        .where('uid',isEqualTo: uid)
        .get();

      DocumentReference userRef=querySnapshot.docs.first.reference;
      await userRef.update({
        'imgLink':downloadUrl
      });
      MySnackBar.successSnackBar(context, "Image Uploaded Successfully");
      return downloadUrl;
    }catch(e){
      MySnackBar.errorSnackBar(context, "Something Went Wrong!!");
      return "";
    }
    
  }
}