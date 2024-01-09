import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecom/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:ecom/consts/consts.dart';

class AuthController extends GetxController {
  Future<UserCredential?> login({email, password, context}) async {
    UserCredential? userCredential;
    try {
      userCredential = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Access the authenticated user from the userCredential
      User? user = userCredential.user;

      if (user != null) {
        Get.to(() => const Home());
      }
    } on FirebaseAuthException catch (e) {
      // Handle specific FirebaseAuth error codes
      if (e.code == 'user-not-found' ||
          e.code == 'wrong-password' ||
          e.code == 'invalid-email') {
        // Show an error dialog for these specific errors
        // showDialog(
        //   context: context,
        //   builder: (BuildContext context) {
        //     return AlertDialog(
        //       title: const Text('Error'),
        //       content: const Text('Invalid email or password.'),
        //       actions: <Widget>[
        //         TextButton(
        //           onPressed: () {
        //             Navigator.pop(context);
        //           },
        //           child: const Text('OK'),
        //         ),
        //       ],
        //     );
        //   },
        // );
        VxToast.show(context, msg: e.toString());
      } else {
        // Handle other FirebaseAuthException errors
        print('FirebaseAuthException: ${e.message}');
      }
    } catch (e) {
      // Handle other exceptions
      print('Error: $e');
    }
    return userCredential;
  }

  Future<UserCredential?> signup({email, password, context}) async {
    UserCredential? userCredential;
    try {
      userCredential = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Access the authenticated user from the userCredential
      User? user = userCredential.user;

      if (user != null) {
        Get.to(() => const Home());
      }
    } on FirebaseAuthException catch (e) {
      // Handle specific FirebaseAuth error codes
      if (e.code == 'user-not-found' ||
          e.code == 'wrong-password' ||
          e.code == 'invalid-email') {
        // Show an error dialog for these specific errors
        // showDialog(
        //   context: context,
        //   builder: (BuildContext context) {
        //     return AlertDialog(
        //       title: const Text('Error'),
        //       content: const Text('Invalid email or password.'),
        //       actions: <Widget>[
        //         TextButton(
        //           onPressed: () {
        //             Navigator.pop(context);
        //           },
        //           child: const Text('OK'),
        //         ),
        //       ],
        //     );
        //   },
        // );
        VxToast.show(context, msg: e.toString());
      } else {
        // Handle other FirebaseAuthException errors
        print('FirebaseAuthException: ${e.message}');
      }
    } catch (e) {
      // Handle other exceptions
      print('Error: $e');
    }
    return userCredential;
  }

  storeUserData({username, email, password, dob, number}) async {
    DocumentReference store =
        firestore.collection(userCollections).doc(currentUser!.uid);
    store.set({
      'username': username,
      'email': email,
      'phoneNumber': number,
      'dob': dob,
      'password': password,
      'imgUrl': ''
    });
  }

  logout(context) async {
    try {
      auth.signOut();
    } catch (e) {
      VxToast.show(context, msg: e.toString());
    }
  }
}
