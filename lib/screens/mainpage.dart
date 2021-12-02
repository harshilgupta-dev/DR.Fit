import 'package:dr_fit/screens/bmi_input_page.dart';
import 'package:dr_fit/screens/chat_screen.dart';
import 'package:dr_fit/screens/home_screen.dart';
import 'package:dr_fit/screens/product_screen.dart';
import 'package:dr_fit/screens/user_profile_screen.dart';
import 'package:dr_fit/utils/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key, this.user}) : super(key: key);

  final User? user;
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: IndexedStack(
        index: currentIndex,
        children: [
          HomeScreen(
            user: widget.user,
          ),
          const ProductsScreen(),
          const InputPage(),
          UserProfileScreen(
            user: widget.user,
          ),
        ],
      ),
      bottomNavigationBar: BottomNavyBar(
          containerHeight: size.height * .08,
          itemCornerRadius: 15,
          curve: Curves.ease,
          animationDuration: const Duration(milliseconds: 400),
          selectedIndex: currentIndex,
          onItemSelected: (index) {
            setState(() {
              currentIndex = index;
            });
          },
          items: [
            BottomNavyBarItem(
              icon: const Icon(Icons.home_outlined),
              inactiveColor: Colors.black,
              activeColor: kActiveIconColor,
              title: const Text('Home'),
            ),
            BottomNavyBarItem(
              icon: const Icon(Icons.shopping_bag),
              inactiveColor: Colors.black,
              activeColor: const Color(0xFF71DFE7),
              title: const Text('Shopping'),
            ),
            BottomNavyBarItem(
              icon: const FaIcon(
                FontAwesomeIcons.calculator,
                size: 20,
              ),
              inactiveColor: Colors.black,
              activeColor: Colors.amber,
              title: const Text('BMI'),
            ),
            BottomNavyBarItem(
              icon: const Icon(Icons.supervised_user_circle),
              inactiveColor: Colors.black,
              activeColor: const Color(0xFFF5CEB8),
              title: const Text('Profile'),
            ),
          ]),
    );
  }
}
