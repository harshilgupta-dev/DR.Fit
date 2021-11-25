import 'package:cached_network_image/cached_network_image.dart';
import 'package:dr_fit/screens/excercise_category_screen.dart';
import 'package:dr_fit/utils/authentication_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../widgets/category_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              height: size.height * 0.40,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20)),
                color: Color(0xFFF5CEB8),
                image: DecorationImage(
                    image: AssetImage('images/undraw_pilates_gpdb.png'),
                    alignment: Alignment.centerLeft),
              ),
            ),
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.topRight,
                      child: InkWell(
                        onTap: () {
                          AuthenticationService.signOut(context: context);
                        },
                        child: Container(
                          alignment: Alignment.center,
                          height: 42,
                          width: 42,
                          decoration: const BoxDecoration(
                            color: Color(0xFFF2BEA1),
                            shape: BoxShape.circle,
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(25),
                            child: Image(
                              fit: BoxFit.cover,
                              image: CachedNetworkImageProvider(FirebaseAuth
                                  .instance.currentUser!.photoURL
                                  .toString()),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Text(
                      'Hello,\n${FirebaseAuth.instance.currentUser!.displayName!.split(' ')[0]}',
                      style: const TextStyle(
                          fontWeight: FontWeight.w900, fontSize: 40),
                    )
                  ],
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 10, right: 10),
              margin: EdgeInsets.only(top: size.height * .33),
              height: size.height * .60,
              child: Column(
                children: [
                  Row(
                    children: [
                      CategoryCard(
                        title: 'Diet Recommendation',
                        imagepath: 'icons/Hamburger.svg',
                        press: () {},
                      ),
                      CategoryCard(
                        title: 'Exercises',
                        imagepath: 'icons/Excrecises.svg',
                        press: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (ctx) =>
                                  const ExcerciseCategoryScreen()));
                        },
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      CategoryCard(
                        title: 'Meditation',
                        imagepath: 'icons/Meditation.svg',
                        press: () {},
                      ),
                      CategoryCard(
                          title: 'Yoga',
                          imagepath: 'icons/yoga.svg',
                          press: () {}),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
