import 'package:flutter/material.dart';
import 'package:practice/Screens/cart_screen.dart';
import 'package:practice/Screens/favourite.dart';
import 'package:practice/Screens/home_page.dart';
import 'package:practice/Screens/info_screen.dart';
import 'package:practice/Screens/profile.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int currentindex = 0;
  List<Widget> pages = [
    const HomePage(),
    Favourite(),
    const Cart(),
    const Info(),
    const Profile()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentindex],
      bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.green[800],
          unselectedItemColor: Colors.black,
          currentIndex: currentindex,
          onTap: (value) {
            setState(() {
              currentindex = value;
            });
          },
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined), label: "home"),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite_border), label: "fav"),
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart_outlined), label: "shopping"),
            BottomNavigationBarItem(
                icon: Icon(Icons.info_outline), label: "info"),
            BottomNavigationBarItem(
                icon: Icon(Icons.person_outline_sharp), label: "person"),
          ]),
    );
  }
}
