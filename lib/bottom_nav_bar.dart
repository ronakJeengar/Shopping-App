import 'package:ecom/items/cart.dart';
import 'package:ecom/items/notification.dart';
import 'package:ecom/items/profile.dart';
import 'package:ecom/screens/category_screen/category_screen.dart';
import 'package:ecom/screens/home_screen/home_screen.dart';
import 'package:flutter/material.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int _currentIndex = 0;
  final List<BarItem> _barItems = [
    const BarItem(icon: Icons.home, title: 'Home'),
    const BarItem(icon: Icons.shopping_cart, title: 'Cart'),
    const BarItem(icon: Icons.notification_important, title: 'Notification'),
    const BarItem(icon: Icons.person, title: 'Profile'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_barItems[_currentIndex].title), // Set the title based on the selected index
      ),
      body: IndexedStack(
        index: _currentIndex,
        children: const [
          HomeScreen(),
          CategoryScreen(),
          CartScreen(),
          ProfileScreen()
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        selectedItemColor: Colors.blue,
        backgroundColor: Colors.white,
        unselectedItemColor: Colors.grey,
        items: _barItems
            .asMap()
            .map((index, item) {
          return MapEntry(
            index,
            BottomNavigationBarItem(
              icon: Icon(item.icon),
              label: item.title,
            ),
          );
        })
            .values
            .toList(),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed('/makeplan');
        },
        backgroundColor: Colors.blue,
        child: const Icon(Icons.add),
      ),
    );
  }
}

class BarItem {
  final IconData icon;
  final String title;

  const BarItem({required this.icon, required this.title});
}
