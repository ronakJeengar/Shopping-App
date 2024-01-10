// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:ecom/common_widgets/app_logo.dart';
// import 'package:ecom/common_widgets/bg.dart';
// import 'package:ecom/common_widgets/button.dart';
// import 'package:ecom/common_widgets/input_text_field.dart';
// import 'package:ecom/consts/consts.dart';
// import 'package:ecom/controller/auth_controller.dart';
// import 'package:ecom/home.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:get/get.dart';
// import 'package:intl/intl.dart';
//
// class SignUpScreen extends StatefulWidget {
//   const SignUpScreen({super.key});
//
//   @override
//   State<SignUpScreen> createState() => _SignUpScreenState();
// }
//
// class _SignUpScreenState extends State<SignUpScreen> {
//   final TextEditingController _usernameController = TextEditingController();
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();
//   final TextEditingController _confirmPasswordController =
//       TextEditingController();
//   final TextEditingController _numberController = TextEditingController();
//   final TextEditingController _dobController = TextEditingController();
//   bool isChecked = false;
//   final AuthController authController = Get.find<AuthController>();
//
//   bool isPasswordValid(String value) {
//     // Minimum 8 characters, maximum 16 characters
//     if (value.length < 8 || value.length > 16) {
//       return false;
//     }
//
//     // Regex pattern to match the criteria: lowercase, uppercase, special character, and number
//     final pattern = RegExp(
//         r'^(?=.*?[a-z])(?=.*?[A-Z])(?=.*?[0-9])(?=.*?[!@#$%^&*()_+{}|<>?]).{8,16}$');
//
//     // Check if the value matches the pattern
//     return pattern.hasMatch(value);
//   }
//
//   String? validatePassword(String? value) {
//     if (value == null || value.isEmpty) {
//       return 'Password is required';
//     }
//
//     if (!isPasswordValid(value)) {
//       return 'Password must be 8-16 characters and contain lowercase, uppercase, special character, and number';
//     }
//
//     return null; // Return null if validation passes
//   }
//
//   Future<void> _selectDate(BuildContext context) async {
//     final ThemeData theme = Theme.of(context).copyWith(
//       colorScheme: const ColorScheme.light().copyWith(
//         primary: redColor, // Change primary color
//         onPrimary: Colors.white, // Change text color
//       ),
//       textButtonTheme: TextButtonThemeData(
//         style: TextButton.styleFrom(
//           foregroundColor: redColor, // Change button text color
//         ),
//       ),
//     );
//
//     final DateTime? picked = await showDatePicker(
//       context: context,
//       initialDate: DateTime.now(),
//       firstDate: DateTime(1900),
//       lastDate: DateTime.now(),
//       builder: (BuildContext context, Widget? child) {
//         return Theme(
//           data: theme,
//           child: child ?? const SizedBox(), // Wrap the date picker in a Theme
//         );
//       },
//     );
//
//     if (picked != null) {
//       final formattedDate = DateFormat('dd-MM-yyyy').format(picked);
//       setState(() {
//         _dobController.text = formattedDate;
//       });
//     }
//   }
//
//   @override
//   void dispose() {
//     _usernameController.dispose();
//     _emailController.dispose();
//     _passwordController.dispose();
//     _confirmPasswordController.dispose();
//     _numberController.dispose();
//     _dobController.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return bg(
//         child: Scaffold(
//       appBar: AppBar(
//         title: const Text(
//           'Sign Up',
//           style: TextStyle(color: Colors.white),
//         ),
//         backgroundColor: redColor,
//         leading: IconButton(
//           color: Colors.white,
//           icon: const Icon(Icons.arrow_back),
//           onPressed: () {
//             // Navigate back to the previous screen
//             Navigator.pop(context);
//           },
//         ),
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             (context.screenHeight * 0.05).heightBox,
//             appLogo(),
//             10.heightBox,
//             "Register to $appname".text.fontFamily(bold).size(22).white.make(),
//             10.heightBox,
//             Padding(
//               padding: const EdgeInsets.all(20.0),
//               child: Card(
//                   child: Padding(
//                 padding: const EdgeInsets.all(20.0),
//                 child: Column(
//                   children: [
//                     inputTextField(
//                         controller: _usernameController,
//                         labelText: 'Username',
//                         icon: Icons.person,
//                         color: redColor,
//                         inputType: TextInputType.text),
//                     10.heightBox,
//                     inputTextField(
//                         controller: _emailController,
//                         labelText: 'Email',
//                         icon: Icons.email,
//                         color: redColor,
//                         inputType: TextInputType.emailAddress),
//                     10.heightBox,
//                     inputText(
//                         controller: _passwordController,
//                         obsecureText: true,
//                         labelText: 'Password',
//                         validator: validatePassword,
//                         color: redColor),
//                     10.heightBox,
//                     inputText(
//                         controller: _confirmPasswordController,
//                         obsecureText: false,
//                         labelText: 'Confirm Password',
//                         validator: validatePassword,
//                         color: redColor),
//                     10.heightBox,
//                     inputTextField(
//                         controller: _numberController,
//                         labelText: 'Mobile Number',
//                         icon: Icons.phone,
//                         color: redColor,
//                         inputType: TextInputType.phone),
//                     10.heightBox,
//                     buildDateField(
//                         controller: _dobController,
//                         label: 'DOB',
//                         color: redColor,
//                         onPressedCallback: () {
//                           _selectDate(context);
//                         }),
//                     10.heightBox,
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: <Widget>[
//                         Checkbox(
//                             activeColor: redColor,
//                             value: isChecked,
//                             onChanged: (newValue) {
//                               setState(() {
//                                 isChecked = newValue!;
//                               });
//                             }),
//                         Expanded(
//                             child: RichText(
//                           text: const TextSpan(children: [
//                             TextSpan(
//                                 text: 'I agree to the ',
//                                 style: TextStyle(
//                                     fontFamily: bold,
//                                     fontSize: 20,
//                                     color: Colors.grey)),
//                             TextSpan(
//                                 text: 'Terms and Conditions',
//                                 style: TextStyle(
//                                     fontFamily: bold,
//                                     fontSize: 20,
//                                     color: redColor)),
//                             TextSpan(
//                                 text: ' & ',
//                                 style: TextStyle(
//                                     fontFamily: bold,
//                                     fontSize: 20,
//                                     color: Colors.grey)),
//                             TextSpan(
//                                 text: 'Privacy Policy.',
//                                 style: TextStyle(
//                                     fontFamily: bold,
//                                     fontSize: 20,
//                                     color: redColor))
//                           ]),
//                         ))
//                       ],
//                     ),
//                     10.heightBox,
//                     elevatedBtnFunction(
//                         buttonName: 'Sign Up',
//                         textColor: Colors.white,
//                         buttonColor: isChecked == true ? redColor : Colors.grey,
//                         onPressedCallback: () {
//                           // if (isChecked == true) {
//                             _validateInputs();
//                           // } else {
//                           //   const snackBar = SnackBar(
//                           //     content: Text('This is a snackbar'),
//                           //   );
//                           //   // Display the snackbar using ScaffoldMessenger
//                           //   ScaffoldMessenger.of(context).showSnackBar(snackBar);
//                           // }
//                         }).box.width(context.screenWidth - 50).make(),
//                   ],
//                 ),
//               )),
//             ),
//           ],
//         ),
//       ),
//     ));
//   }
//
//   Future<void> _validateInputs() async {
//     if (_usernameController.text.isEmpty ||
//         _emailController.text.isEmpty ||
//         _passwordController.text.isEmpty ||
//         _confirmPasswordController.text.isEmpty ||
//         _numberController.text.isEmpty ||
//         _dobController.text.isEmpty) {
//       // Show an error or handle empty fields here
//       showDialog(
//         context: context,
//         builder: (BuildContext context) {
//           return AlertDialog(
//             title: const Text('Error'),
//             content: const Text('Please fill in all fields.'),
//             actions: <Widget>[
//               TextButton(
//                 onPressed: () {
//                   Navigator.of(context).pop();
//                 },
//                 child: const Text('OK'),
//               ),
//             ],
//           );
//         },
//       );
//     } else {
//       // All fields are filled, proceed with sign-up
//       if (_passwordController.text != _confirmPasswordController.text) {
//         // Show an error if passwords do not match
//         showDialog(
//           context: context,
//           builder: (BuildContext context) {
//             return AlertDialog(
//               title: const Text('Error'),
//               content: const Text('Passwords do not match.'),
//               actions: <Widget>[
//                 TextButton(
//                   onPressed: () {
//                     Navigator.of(context).pop();
//                   },
//                   child: const Text('OK'),
//                 ),
//               ],
//             );
//           },
//         );
//       } else {
//         try {
//           // Create user with email and password
//           UserCredential? userCredential =
//           await authController.signUpWithEmailAndPassword(_emailController.text, _passwordController.text);
//
//           if (userCredential!.user != null) {
//             await FirebaseFirestore.instance.collection('users').doc(userCredential.user!.uid).set({
//               'username': _usernameController.text,
//               'email': _emailController.text,
//               'phoneNumber': _numberController.text,
//               'dob': _dobController.text,
//               'password': _passwordController.text,
//               // Add other fields as needed
//             });
//            Get.to(() => const Home());
//           }
//         } on FirebaseAuthException catch (e) {
//           // Show an error if account creation fails
//           showDialog(
//             context: context,
//             builder: (BuildContext context) {
//               return AlertDialog(
//                 title: const Text('Error'),
//                 content: Text('${e.message}'),
//                 actions: <Widget>[
//                   TextButton(
//                     onPressed: () {
//                       Navigator.of(context).pop();
//                     },
//                     child: const Text('OK'),
//                   ),
//                 ],
//               );
//             },
//           );
//         }
//       }
//     }
//   }
// }

import 'package:ecom/controller/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpPage extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();

  final AuthController authController = Get.find<AuthController>();

  SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              controller: _emailController,
              decoration: const InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16.0),
            TextFormField(
              controller: _usernameController,
              decoration: const InputDecoration(
                labelText: 'Username',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16.0),
            TextFormField(
              controller: _passwordController,
              decoration: const InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
              ),
              obscureText: true,
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                signUp();
              },
              child: const Text('Sign Up'),
            ),
          ],
        ),
      ),
    );
  }

  void signUp() {
    String email = _emailController.text.trim();
    String password = _passwordController.text.trim();
    String username = _usernameController.text.trim();

    if (email.isNotEmpty && password.isNotEmpty) {
      authController.signUpWithEmailAndPassword(email, password, username);
    } else {
      // Show error message if email or password is empty
      Get.snackbar('Error', 'Please enter email and password',
          snackPosition: SnackPosition.BOTTOM);
    }
  }
}
