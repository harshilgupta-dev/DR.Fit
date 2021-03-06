import 'dart:async';
import 'package:dr_fit/screens/mainpage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final Tween<double> _scaleTween = Tween<double>(begin: 0.2, end: 1.2);
  @override
  void initState() {
    super.initState();
    getTimer();
  }

  void finished() async {
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => FirebaseAuth.instance.currentUser != null
              ? MainPage(
                  user: FirebaseAuth.instance.currentUser,
                )
              : const LoginScreen(),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        elevation: 0,
        backgroundColor: Colors.transparent,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
        ),
      ),
      backgroundColor: Colors.white,
      body: TweenAnimationBuilder(
        curve: Curves.bounceIn,
        tween: _scaleTween,
        duration: const Duration(milliseconds: 1500),
        builder: (ctx, double scale, child) {
          return Transform.scale(
            scale: scale,
            child: child,
          );
        },
        child: Container(
          alignment: Alignment.center,
          child: Image(
            image: const AssetImage('assets/images/splash.png'),
            width: MediaQuery.of(context).size.width * 0.45,
          ),
        ),
      ),
    );
  }

  void getTimer() {
    Timer(const Duration(seconds: 3), finished);
  }
}
