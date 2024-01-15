import 'package:get/get.dart';

class CartController extends GetxController {
  var totalPrice = 0.obs;

  int calculateTotalPrice(data) {
    for (int i = 0; i < data.length; i++) {
      totalPrice = totalPrice + int.parse(data[i]['totalPrice'].toString());
    }
    return totalPrice.value;
  }
}
