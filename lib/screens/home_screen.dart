import 'package:cached_network_image/cached_network_image.dart';
import 'package:dr_fit/helpers/shared_prefrences.dart';
import 'package:dr_fit/models/meditation.dart';
import 'package:dr_fit/models/normal.dart';
import 'package:dr_fit/models/overweight.dart';
import 'package:dr_fit/models/underweight.dart';
import 'package:dr_fit/models/yoga.dart';
import 'package:dr_fit/screens/excercise_category_screen.dart';
import 'package:dr_fit/screens/list_screen.dart';
import 'package:dr_fit/screens/user_profile_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../widgets/category_card.dart';
import 'diet_recommendation_screen.dart';

// ignore: must_be_immutable
class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key, this.user}) : super(key: key);
  final User? user;
  final SharedPrefrencesHelper _prefrencesHelper = SharedPrefrencesHelper();
  late String? bmiResultText;
  getData() async {
    bmiResultText = await _prefrencesHelper.getStringPrefrences('resultText');
  }

  @override
  Widget build(BuildContext context) {
    getData();
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        elevation: 0,
        backgroundColor: const Color(0xFFF5CEB8),
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
        ),
      ),
      body: Stack(
        children: [
          Container(
            height: size.height * 0.37,
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
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: InkWell(
                    onTap: () {
                      // AuthenticationService.signOut(context: context)
                      //     .whenComplete(() => Navigator.of(context)
                      //         .pushReplacement(MaterialPageRoute(
                      //             builder: (ctx) => const LoginScreen())));
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (ctx) => UserProfileScreen(
                                user: user,
                              )));
                    },
                    child: CircleAvatar(
                      backgroundColor: const Color(0xFFF5CEB8),
                      maxRadius: 23,
                      backgroundImage: CachedNetworkImageProvider(FirebaseAuth
                          .instance.currentUser!.photoURL
                          .toString()),
                    ),
                    // child: Container(
                    //   alignment: Alignment.center,
                    //   height: 42,
                    //   width: 42,
                    //   decoration: const BoxDecoration(
                    //     color: Color(0xFFF2BEA1),
                    //     shape: BoxShape.circle,
                    //   ),
                    //   child: ClipRRect(
                    //     borderRadius: BorderRadius.circular(25),
                    //     child: Image(
                    //       fit: BoxFit.cover,
                    //       image: CachedNetworkImageProvider(FirebaseAuth
                    //           .instance.currentUser!.photoURL
                    //           .toString()),
                    //     ),
                    //   ),
                    // ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Text(
                    'Hello,\n${FirebaseAuth.instance.currentUser!.displayName!.split(' ')[0]}',
                    style: const TextStyle(
                        fontWeight: FontWeight.w900, fontSize: 40),
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: size.height * .33),
            height: size.height * .55,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CategoryCard(
                      title: 'Diet Recommendation',
                      imagepath: 'icons/Hamburger.svg',
                      press: () {
                        String? text = bmiResultText;
                        if (text == 'Underweight') {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (ctx) => const DietRecommendationScreen(
                                  data: underWeightList)));
                        } else if (text == 'Overweight') {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (ctx) => const DietRecommendationScreen(
                                  data: overWeightList)));
                        } else if (text == 'Normal') {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (ctx) => const DietRecommendationScreen(
                                  data: normalWeightList)));
                        } else {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (ctx) =>
                                  const DietRecommendationScreen(data: [])));
                        }
                      },
                    ),
                    CategoryCard(
                      title: 'Exercises',
                      imagepath: 'icons/Excrecises.svg',
                      press: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (ctx) => const ExcerciseCategoryScreen()));
                      },
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CategoryCard(
                      title: 'Meditation',
                      imagepath: 'icons/Meditation.svg',
                      press: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (ctx) =>
                                ListScreen(data: meditationList)));
                      },
                    ),
                    CategoryCard(
                        title: 'Yoga',
                        imagepath: 'icons/yoga.svg',
                        press: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (ctx) => ListScreen(data: yogaList)));
                        }),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
