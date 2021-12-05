import 'package:cached_network_image/cached_network_image.dart';
import 'package:dr_fit/screens/about_us.dart';
import 'package:dr_fit/screens/chat_screen.dart';
import 'package:dr_fit/screens/login_screen.dart';
import 'package:dr_fit/utils/authentication_service.dart';
import 'package:dr_fit/widgets/new_elevated_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({Key? key, this.user}) : super(key: key);
  final User? user;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color.fromRGBO(247, 247, 247, .9),
      body: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(size.width * 0.3)),
                image: DecorationImage(
                    alignment: Alignment.topCenter,
                    colorFilter: ColorFilter.mode(
                        Colors.black.withOpacity(.6), BlendMode.colorBurn),
                    image: const CachedNetworkImageProvider(
                        'https://us.123rf.com/450wm/romastudio/romastudio1812/romastudio181200219/117004065-sports-equipment-on-a-black-background-top-view-motivation.jpg'))),
          ),
          Positioned(
            top: size.height * 0.21,
            child: CircleAvatar(
              maxRadius: size.width * .18,
              backgroundImage: CachedNetworkImageProvider(
                user!.photoURL.toString(),
              ),
            ),
          ),
          Positioned(
            top: size.height * 0.39,
            child: Column(
              children: [
                Text(
                  user!.displayName.toString(),
                  style: const TextStyle(
                    fontFamily: 'Pacifico',
                    fontSize: 35,
                    letterSpacing: 2,
                  ),
                ),
                SizedBox(
                  height: size.height * .015,
                ),
                Text(
                  user!.email.toString(),
                  style: const TextStyle(
                      fontSize: 13,
                      color: Colors.black26,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Pacifico',
                      letterSpacing: 1),
                ),
                SizedBox(
                  height: size.height * .055,
                ),
                NewElevatedButton(
                  label: 'Chat',
                  color: Colors.blue,
                  icon: FontAwesomeIcons.facebookMessenger,
                  press: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => ChatScreen()));
                  },
                ),
                SizedBox(
                  height: size.height * .03,
                ),
                NewElevatedButton(
                  label: 'About Us',
                  color: Colors.black,
                  icon: FontAwesomeIcons.infoCircle,
                  press: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => AboutUs()));
                  },
                ),
                SizedBox(
                  height: size.height * .010,
                ),
                NewElevatedButton(
                  label: 'Contact Us',
                  color: Colors.black,
                  icon: FontAwesomeIcons.phoneAlt,
                  press: () {},
                ),
                SizedBox(
                  height: size.height * .030,
                ),
                NewElevatedButton(
                  label: 'Sign Out',
                  color: Colors.redAccent,
                  icon: FontAwesomeIcons.signOutAlt,
                  press: () {
                    AuthenticationService.signOut(context: context);
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (ctx) => const LoginScreen()));
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
