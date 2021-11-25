import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../utils/constants.dart';

class CategoryCard extends StatelessWidget {
  final String title;
  final VoidCallback press;
  final String imagepath;

  const CategoryCard(
      {Key? key,
      required this.title,
      required this.imagepath,
      required this.press})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(10),
      height: size.height * .25,
      width: size.width * .415,
      decoration: BoxDecoration(
        boxShadow: const [
          BoxShadow(
            offset: Offset(20, 30),
            blurRadius: 17,
            spreadRadius: -15,
            color: kShadowColor,
          ),
        ],
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: InkWell(
        onTap: press,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(imagepath),
            const SizedBox(
              height: 40,
            ),
            Text(
              title,
              style: Theme.of(context).textTheme.button,
            )
          ],
        ),
      ),
    );
  }
}
