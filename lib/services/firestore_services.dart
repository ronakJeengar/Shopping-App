import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecom/consts/firebase_consts.dart';

class FirestoreServices {
  //get user method
  static getUser(uid) {
    return firestore
        .collection('users')
        .where('id', isEqualTo: uid)
        .snapshots();
  }

  //get products
  static getProducts(category) {
    return firestore
        .collection('products')
        .where('product_category', isEqualTo: category)
        .snapshots();
  }

  //get cart
  static getCart(uid) {
    return firestore.collection('cart').where('added_by', isEqualTo: uid).snapshots();
  }
}
