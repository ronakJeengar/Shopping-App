import 'package:ecom/consts/consts.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ProfileController extends GetxController{

  RxString profileImgPath = ''.obs;
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

}