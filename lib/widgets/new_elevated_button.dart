import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NewElevatedButton extends StatelessWidget {
  const NewElevatedButton(
      {Key? key,
      required this.color,
      required this.icon,
      required this.label,
      required this.press})
      : super(key: key);

  final Color color;
  final VoidCallback press;
  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ElevatedButton(
        style: ElevatedButton.styleFrom(elevation: 10, primary: color),
        onPressed: press,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10),
          width: size.width * .8,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FaIcon(icon),
              SizedBox(
                width: size.height * .01,
              ),
              Text(label,
                  style: const TextStyle(
                    fontSize: 20,
                  ))
            ],
          ),
        ));
  }
}
