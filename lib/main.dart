import 'package:dr_fit/screens/splash_screen.dart';

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import './utils/constants.dart';

import 'helpers/custom_page_transition_builder.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fitness App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        pageTransitionsTheme: PageTransitionsTheme(builders: {
          TargetPlatform.android: CustomPageTransitionBuilder(),
        }),
        primaryColorLight: Constants.primaryLight,
        appBarTheme: AppBarTheme(
          color: Constants.appBarColor,
          titleTextStyle: const TextStyle(
            fontFamily: 'Cairo',
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
          iconTheme: const IconThemeData(color: Colors.black),
        ),
      ),
      home: const SplashScreen(),
    );
  }
}
