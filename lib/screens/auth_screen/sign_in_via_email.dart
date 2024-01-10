import 'package:ecom/common_widgets/app_logo.dart';
import 'package:ecom/common_widgets/bg.dart';
import 'package:ecom/common_widgets/circular_avatar.dart';
import 'package:ecom/consts/colors.dart';
import 'package:ecom/consts/consts.dart';
import 'package:ecom/controller/auth_controller.dart';
import 'package:ecom/screens/auth_screen/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignInPage extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final AuthController authController = Get.find<AuthController>();

  SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return bg(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Sign In'),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                appLogo(),
                const SizedBox(height: 20),
                Container(
                  color: Colors.white,
                  padding: const EdgeInsets.all(20.0),
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
                          signIn();
                        },
                        child: const Text('Sign In'),
                      ),
                      const SizedBox(height: 16.0),
                      const Row(
                        children: [
                          Expanded(
                            child: Divider(
                              thickness: 1,
                              color: Colors.grey,
                            ),
                          ),
                          Text(" or "),
                          Expanded(
                            child: Divider(
                              thickness: 1,
                              color: Colors.grey,
                            ),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          circularAvatar(bgColor: lightGrey, radius: 20, image: icGoogleLogo, width: 2),
                          const SizedBox(width: 10.0),
                          circularAvatar(bgColor: lightGrey, radius: 20, image: icGoogleLogo, width: 2)
                        ],
                      ),
                       Row(
                         mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Don't have an account?"
                          ),
                          TextButton(onPressed: (){
                            Get.to(() => SignUpPage());
                          }, child: const Text(
                            "Sign Up",
                            style: TextStyle(
                              fontSize: 16
                            ),
                          ))
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void signIn() {
    String email = _emailController.text.trim();
    String password = _passwordController.text.trim();

    if (email.isNotEmpty && password.isNotEmpty) {
      authController.signInWithEmailAndPassword(email, password);
    } else {
      Get.snackbar('Error', 'Please enter email and password',
          snackPosition: SnackPosition.BOTTOM);
    }
  }
}
