import 'excercise_category_screen.dart';
// import 'excercise_list_screen.dart';
import 'login_screen.dart';
import 'package:dr_fit/utils/authentication_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({Key? key, this.user}) : super(key: key);
  final User? user;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 50,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Image.network(
                  user!.photoURL.toString(),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              "Hello, ${user?.displayName}",
              textScaleFactor: 1.5,
            ),
            const SizedBox(
              height: 20,
            ),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (ctx) => const ExcerciseCategoryScreen()));
                },
                child: const Text('Excercise Srcreen'),
              ),
            ),
            Center(
              child: ElevatedButton(
                  onPressed: () {
                    AuthenticationService.signOut(context: context);
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (ctx) => const LoginScreen()));
                  },
                  child: const Text('Sign Out')),
            ),
          ],
        ),
      ),
    );
  }
}
