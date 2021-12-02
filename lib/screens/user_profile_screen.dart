import 'package:cached_network_image/cached_network_image.dart';
import 'package:dr_fit/screens/chat_screen.dart';
import 'package:dr_fit/screens/login_screen.dart';
import 'package:dr_fit/utils/authentication_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({Key? key, this.user}) : super(key: key);
  final User? user;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Profile'),
        // elevation: 0,
        backgroundColor: const Color(0xFFF5CEB8),
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
        ),
      ),
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0, left: 10, top: 10),
            child: Card(
              color: const Color(0xFFF5CEB8),
              elevation: 6,
              child: Container(
                height: MediaQuery.of(context).size.height * .4,
                padding: const EdgeInsets.all(15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: CircleAvatar(
                        maxRadius: MediaQuery.of(context).size.width * .15,
                        backgroundImage: CachedNetworkImageProvider(
                            user!.photoURL.toString()),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Column(
                      children: [
                        customCard(user!.displayName.toString(), context),
                        const SizedBox(
                          height: 10,
                        ),
                        customCard(user!.email.toString(), context),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Card(
              elevation: 6,
              color: const Color(0xFFF5CEB8),
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * .35,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    elevatedButton('Sign Out', () {
                      AuthenticationService.signOut(context: context);
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (ctx) => const LoginScreen()));
                    }),
                    elevatedButton('About Us', () {}),
                    elevatedButton('Contact Us', () {}),
                    elevatedButton('Chat', () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (ctx) => const ChatScreen()));
                    }),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  elevatedButton(String title, onPress) {
    return Container(
      width: 250,
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        onPressed: onPress,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Text(
            title,
            style: const TextStyle(color: Colors.black, fontSize: 18),
          ),
        ),
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.white)),
      ),
    );
  }
}

customCard(text, context) {
  return Card(
    elevation: 4,
    child: Container(
      alignment: Alignment.centerLeft,
      width: MediaQuery.of(context).size.width * 0.9,
      height: MediaQuery.of(context).size.height * 0.06,
      padding: const EdgeInsets.all(8),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 17,
        ),
      ),
    ),
  );
}
