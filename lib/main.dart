import 'package:ecom/controller/auth_controller.dart';
import 'package:ecom/controller/cart_controller.dart';
import 'package:ecom/controller/product_controller.dart';
import 'package:ecom/controller/profile_controller.dart';
import 'package:ecom/controller/home_controller.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'firebase_options.dart';
import 'consts/consts.dart';
import 'package:ecom/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: appname,
      theme: ThemeData(
          scaffoldBackgroundColor: Colors.transparent,
          appBarTheme: const AppBarTheme(
              iconTheme: IconThemeData(
                color: darkFontGrey, // Change the color here
              ),
              backgroundColor: Colors.transparent),
          fontFamily: regular),
      initialBinding: InitialBindings(), // Add this line
      home: const SplashScreen(),
    );
  }
}

class InitialBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(AuthController());
    Get.put(HomeController());
    Get.put(ProfileController());
    Get.put(ProductController());
    Get.put(CartController());
    // Add other controller registrations if needed
  }
}
