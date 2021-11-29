import 'package:flutter/material.dart';
import '../utils/bmi_constants.dart';

class BottomButton extends StatelessWidget {
  const BottomButton({Key? key, required this.onTap, required this.buttonTitle})
      : super(key: key);

  final VoidCallback onTap;
  final String buttonTitle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20)),
            color: kBottomContainerColour,
            boxShadow: [
              BoxShadow(
                  offset: Offset(0, -5),
                  color: Colors.black12,
                  spreadRadius: 2,
                  blurRadius: 6),
            ]),
        padding: const EdgeInsets.only(bottom: 10.0),
        child: Center(
          child: Text(
            buttonTitle,
            style: const TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
                color: Colors.amber),
          ),
        ),
        margin: const EdgeInsets.only(top: 10.0),
        height: kBottomContainerHeight,
        width: double.infinity,
      ),
    );
  }
}
