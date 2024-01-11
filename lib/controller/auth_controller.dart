import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecom/home.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ecom/screens/auth_screen/sign_in_via_email.dart';

class AuthController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  RxBool isLoading = false.obs;

  Rx<User?> currentUser = Rx<User?>(null);

  @override
  void onInit() {
    super.onInit();
    currentUser.value = _auth.currentUser;
    _auth.authStateChanges().listen((user) {
      currentUser.value = user;
    });
  }

  Future<void> signUpWithEmailAndPassword(
      String email, String password, String username) async {
    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (userCredential.user != null) {
        // Sign up successful, you can handle additional actions here if needed
        await _firestore.collection('users').doc(userCredential.user!.uid).set({
          'username': username,
          'email': email,
          'password': password,
          'id': userCredential.user!.uid,
          'imageUrl': '',
          'cartCount': '00',
          'wishListCount': '00',
          'orderCount': '00'

          // Add other fields as needed
        });
        print('Sign-up successful: ${userCredential.user!.email}');
      }
    } catch (e) {
      // Handle sign-up failure (show error message, etc.)
      print('Sign-up failed: $e');
    }
  }

  Future<UserCredential?> signInWithEmailAndPassword(
      String email, String password) async {
    UserCredential? userCredential;

    try {
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      Get.offAll(() => const Home());
      print('Sign-in successful: $email');
      // You can perform additional actions after successful sign-in if needed
    } catch (e) {
      // Handle sign-in failure (show error message, etc.)
      print('Sign-in failed: $e');
    }
    return userCredential;
  }

  void signOut() {
    _auth.signOut();
    Get.to(() => SignInPage());
  }

  void clearCurrentUser() {
    currentUser.value = null;
  }
}
