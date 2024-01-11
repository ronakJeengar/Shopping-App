import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecom/consts/firebase_consts.dart';

class FirestoreServices{

  static getUser(uid){
    return firestore.collection('users').where('id', isEqualTo: uid).snapshots();
  }

}