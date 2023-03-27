import 'package:ecommerce_app/screens/cart_screen.dart';
import 'package:ecommerce_app/screens/favourites_screen.dart';
import 'package:ecommerce_app/screens/main_screen.dart';
import 'package:ecommerce_app/screens/profile_screens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  final List navigationBarList = [
    ['Home', const Icon(IconlyLight.home)],
    ['Cart', const Icon(IconlyLight.bag)],
    ['Favourites', const Icon(IconlyLight.heart)],
    ['Profile', const Icon(IconlyLight.profile)],
  ];
  List navigationBarScreens =  [
    MainScreen(),
    CartScreen(),
    FavouriteScreen(),
    ProfileScreen(),
  ];
  void toggleScreen(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationBarScreens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: navigationBarList
            .map(
              (nav) => BottomNavigationBarItem(
                icon: nav[1],
                label: '${nav[0]}',
              ),
            )
            .toList(),
        currentIndex: _currentIndex,
        onTap: (index) {
          toggleScreen(index);
        },
      ),
    );
  }
}
