import 'package:ecom/common_widgets/app_logo.dart';
import 'package:ecom/common_widgets/bg.dart';
import 'package:ecom/common_widgets/button.dart';
import 'package:ecom/common_widgets/circular_avatar.dart';
import 'package:ecom/common_widgets/input_text_field.dart';
import 'package:ecom/consts/consts.dart';
import 'package:ecom/home.dart';
import 'package:ecom/screens/auth_screen/sign_up.dart';
import 'package:ecom/controller/auth_controller.dart';
import 'package:get/get.dart';

class SignInEmail extends StatefulWidget {
  const SignInEmail({super.key});

  @override
  State<SignInEmail> createState() => _SignInEmailState();
}

class _SignInEmailState extends State<SignInEmail> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  var controller  = Get.put(AuthController());
  bool _isPasswordVisible = false; // Initially, password is hidden

  void _togglePasswordVisibility() {
    setState(() {
      _isPasswordVisible = !_isPasswordVisible; // Toggle the boolean value
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return bg(
        child: Scaffold(
      body: Center(
        child: Column(
          children: [
            (context.screenHeight * 0.1).heightBox,
            appLogo(),
            10.heightBox,
            "Log in to $appname".text.fontFamily(bold).size(22).white.make(),
            10.heightBox,
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Card(
                  child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    inputTextField(
                        controller: _emailController,
                        labelText: 'Email',
                    color: redColor,
                    inputType: TextInputType.emailAddress, icon: Icons.email),
                    10.heightBox,
                    inputPasswordField(
                        controller: _passwordController,
                        labelText: 'Password',
                        obsecureText: !_isPasswordVisible,
                        color: redColor,
                    onPressedCallback: _togglePasswordVisibility),
                    10.heightBox,
                    textGestureButton(
                        buttonName: 'Forgot Password?',
                        textColor: Colors.grey,
                        screen: const SignUpScreen(),
                        alignment: Alignment.centerRight),
                    10.heightBox,
                    elevatedBtnFunction(
                        buttonName: 'Log in',
                        textColor: Colors.white,
                        buttonColor: redColor,
                        onPressedCallback: () async{
                          await controller.login(email: _emailController.text, password: _passwordController.text,context: context).then((value) {
                            if(value != null){
                              Get.offAll(() => const Home());
                            }
                          });
                          // _signInWithEmailAndPassword(
                          //     _emailController.text, _passwordController.text);
                        }).box.width(context.screenWidth - 50).make(),
                    const SizedBox(height: 10.0),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Expanded(
                            child: Divider(
                          thickness: 1,
                          color: Colors.grey,
                        )),
                        Padding(
                          padding: EdgeInsets.all(5.0),
                          child: Text('or'),
                        ),
                        Expanded(
                            child: Divider(
                          thickness: 1,
                          color: Colors.grey,
                        )),
                      ],
                    ),
                    10.heightBox,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        circularAvatar(
                            bgColor: lightGrey,
                            radius: 25,
                            image: icGoogleLogo,
                            width: 30),
                        circularAvatar(
                            bgColor: lightGrey,
                            radius: 25,
                            image: icFacebookLogo,
                            width: 30)
                      ],
                    ),
                    10.heightBox,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Don't have an account? ",
                          style: TextStyle(color: Colors.grey),
                        ),
                        textGestureButton(
                            buttonName: 'Sign Up',
                            textColor: redColor,
                            screen: const SignUpScreen(),
                            alignment: Alignment.center),
                      ],
                    )
                  ],
                ),
              )),
            ),
          ],
        ),
      ),
    ));
  }
}
