import 'package:flutter/material.dart';
import '../utils/constants.dart';

class ProductCard extends StatelessWidget {
  const ProductCard(
      {Key? key,
      required this.imagepath,
      required this.label,
      required this.price,
      required this.size})
      : super(key: key);

  final Size size;

  final String imagepath;
  final String label;
  final int price;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.only(right: 6, bottom: 10),
      width: size.width * .42,
      decoration: BoxDecoration(
        boxShadow: const [
          BoxShadow(
            offset: Offset(20, 30),
            blurRadius: 17,
            spreadRadius: -15,
            color: kShadowColor,
          ),
          BoxShadow(
            offset: Offset(-10, -20),
            blurRadius: 17,
            spreadRadius: -15,
            color: kShadowColor,
          ),
        ],
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            // padding: EdgeInsets.all(5),
            child: Image(
              image: AssetImage(imagepath),
              width: size.width * .40,
              height: size.width * .40,
            ),
          ),
          Text(
            label,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Rs.$price',
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.w900),
              ),
              const Icon(
                Icons.add_shopping_cart_outlined,
                color: Color(0xFF0F2C67),
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: const Color(0xFF71DFE7),
            ),
            // color: Color(0xFF0F2C67),
            child: const Text(
              'Comming Soon',
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
            ),
          )
        ],
      ),
    );
  }
}
