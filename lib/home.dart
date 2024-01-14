import 'package:ecom/consts/consts.dart';
import 'package:ecom/controller/home_controller.dart';
import 'package:ecom/screens/cart_screen/cart_screen.dart';
import 'package:ecom/screens/category_screen/category_screen.dart';
import 'package:ecom/screens/home_screen/home_screen.dart';
import 'package:ecom/screens/profile_screen/profile_screen.dart';
import 'package:flutter/services.dart';
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

  Future<bool?> _showExitDialog(BuildContext context) async {
    return await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Are you sure?'),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(false); // Close the AlertDialog
            },
            child: const Text('No'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context)
                  .pop(true); // Return true when 'Yes' is pressed
              SystemNavigator.pop();
            },
            child: const Text('Yes'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
        onPopInvoked: (bool didPop) async {
          if (didPop) {
            return;
          }
          await _showExitDialog(context);
        },
      child: Scaffold(
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
          ))
    );
  }
}
