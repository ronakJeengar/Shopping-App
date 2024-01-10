import 'package:ecom/consts/consts.dart';
import 'package:ecom/controller/home_controller.dart';
import 'package:ecom/screens/cart_screen/cart_screen.dart';
import 'package:ecom/screens/category_screen/category_screen.dart';
import 'package:ecom/screens/home_screen/home_screen.dart';
import 'package:ecom/screens/profile_screen/profile_screen.dart';
import 'package:get/get.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var homeController = Get.put(HomeController());

  final _barItems = [
    BottomNavigationBarItem(
        icon: Image.asset(icHome, width: 26), label: 'Home'),
    BottomNavigationBarItem(
        icon: Image.asset(icCategories, width: 26), label: 'Categories'),
    BottomNavigationBarItem(
        icon: Image.asset(icCart, width: 26), label: 'Cart'),
    BottomNavigationBarItem(
        icon: Image.asset(icProfile, width: 26), label: 'Profile'),
  ];

  var navItemScreen = [
    const HomeScreen(),
    const CategoryScreen(),
    const Cart(), Profile()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          children: [
            Obx(() => Expanded(
                child:
                    navItemScreen.elementAt(homeController.currentIndex.value)))
          ],
        ),
        bottomNavigationBar: Obx(
          () => BottomNavigationBar(
            currentIndex: homeController.currentIndex.value,
            selectedItemColor: redColor,
            selectedLabelStyle: const TextStyle(fontFamily: semibold),
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.white,
            items: _barItems,
            onTap: (value) {
              homeController.currentIndex.value = value;
            },
          ),
        ));
  }
}
