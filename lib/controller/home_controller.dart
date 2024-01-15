import 'package:ecom/consts/consts.dart';
import 'package:get/get.dart';

class HomeController extends GetxController{

  var currentIndex = 0.obs;
  dynamic username = '';

  getUsername() async {
    dynamic name = await firestore.collection('users').where('id', isEqualTo: currentUser!.uid).get().then((value) {
      if(value.docs.isNotEmpty){
        return value.docs.single['username'];
      }
    });
    username = name;
  }
}