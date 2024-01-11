import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecom/consts/consts.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:path/path.dart';
import 'package:image_picker/image_picker.dart';

class ProfileController extends GetxController{

  RxString profileImgPath = ''.obs;
  dynamic profileImageLink = '';
  RxBool isLoading = false.obs;

  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  changeImage(context) async{
      try{
        final img = await ImagePicker().pickImage(source: ImageSource.gallery,imageQuality: 70);
        if (img == null) return;
        profileImgPath.value = img.path;
      }on PlatformException catch(e){
          VxToast.show(context, msg : e.toString());
      }
  }

  uploadProfileImage() async{
    dynamic filename = basename(profileImgPath.value);
    dynamic destination = 'images/${currentUser!.uid}/$filename';
    Reference ref = FirebaseStorage.instance.ref().child(destination);
    await ref.putFile(File(profileImgPath.value));
    profileImageLink = await ref.getDownloadURL();
  }

  updateProfile({username, password, imageUrl}) async{
    dynamic store = firestore.collection('users').doc(currentUser!.uid);
    await store.set({
      'username': username,
      'password': password,
      'imageUrl': imageUrl
    }, SetOptions(merge: true));
    isLoading(false);
  }

}