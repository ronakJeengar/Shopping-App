import 'package:ecom/common_widgets/app_logo.dart';
import 'package:ecom/consts/consts.dart';
import 'package:ecom/screens/auth_screen/sign_in_via_email.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  changeScreen(){
    Future.delayed(const Duration(seconds: 3),(){
      Get.to(() =>  const SignInEmail());
    });
  }

  @override
  void initState() {
    changeScreen();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: redColor,
      body: Center(
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Image.asset(icSplashBg,width: 300),
            ),
            20.heightBox,
            appLogo(),
            10.heightBox,
            appname.text.fontFamily(bold).size(22).white.make(),
            5.heightBox,
            appversion.text.fontFamily(bold).size(16).white.make(),
            const Spacer(),
            credits.text.white.make()
          ],
        ),
      ),
    );
  }
}
