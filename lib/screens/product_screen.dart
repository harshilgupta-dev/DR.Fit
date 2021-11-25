import './add_to_cart.dart';
import '../utils/constants.dart';
import 'package:flutter/material.dart';
import '../widgets/product_card.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({Key? key}) : super(key: key);

  @override
  _ProductsScreenState createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              height: size.height * 0.2,
              decoration: const BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      offset: Offset(0, 6),
                      color: kShadowColor,
                      spreadRadius: 3,
                      blurRadius: 3)
                ],
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20)),
                color: Color(0xFF71DFE7),
              ),
            ),
            SafeArea(
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: size.height * .03),
                    padding: EdgeInsets.only(
                        left: size.width * .05, right: size.width * .05),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Online Shopping",
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Cairo',
                              fontSize: 30,
                              fontWeight: FontWeight.bold),
                        ),
                        IconButton(
                          color: Colors.black,
                          splashColor: Colors.red,
                          onPressed: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return const AddToCart();
                            }));
                          },
                          icon: const Icon(
                            Icons.shopping_cart_outlined,
                            size: 35,
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: size.height * .7,
                    padding: EdgeInsets.symmetric(horizontal: size.width * .06),
                    margin: EdgeInsets.only(top: size.height * .06),
                    child: ListView(children: [
                      Row(
                        children: [
                          ProductCard(
                            size: size,
                            imagepath: 'images/product1.jpeg',
                            label: 'Mass Gainer',
                            price: 899,
                          ),
                          ProductCard(
                            size: size,
                            imagepath: 'images/product3.jpeg',
                            label: '2.5KG Dumbell ',
                            price: 499,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          ProductCard(
                            size: size,
                            imagepath: 'images/product7.jpeg',
                            label: 'Abdominal Roller',
                            price: 750,
                          ),
                          ProductCard(
                            size: size,
                            imagepath: 'images/product4.jpeg',
                            label: ' 5KG Disc Plate',
                            price: 1000,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          ProductCard(
                            size: size,
                            imagepath: 'images/product5.jpeg',
                            label: '1KG Dumbell',
                            price: 299,
                          ),
                          ProductCard(
                            size: size,
                            imagepath: 'images/product6.jpeg',
                            label: 'Yoga Mat',
                            price: 499,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          ProductCard(
                            size: size,
                            imagepath: 'images/product8.jpeg',
                            label: 'Toning Tube',
                            price: 799,
                          ),
                          ProductCard(
                            size: size,
                            imagepath: 'images/product9.jpeg',
                            label: 'Weight Lifting Belt',
                            price: 899,
                          ),
                        ],
                      ),
                    ]),
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
