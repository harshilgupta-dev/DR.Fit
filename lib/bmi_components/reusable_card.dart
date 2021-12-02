import 'package:dr_fit/utils/constants.dart';
import 'package:flutter/material.dart';

class ResuableCard extends StatelessWidget {
  const ResuableCard(
      {Key? key,
      required this.colour,
      required this.cardChild,
      required this.onPress})
      : super(key: key);

  final Color colour;
  final Widget cardChild;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: cardChild,
        margin: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
              offset: Offset(5, 5),
              color: kShadowColor,
              spreadRadius: 8,
              blurRadius: 8,
            ),
            BoxShadow(
              offset: Offset(-2, -2),
              color: kShadowColor,
            )
          ],
          color: colour,
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}
