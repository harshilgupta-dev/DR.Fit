import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DescriptionScreen extends StatelessWidget {
  const DescriptionScreen({Key? key, required this.data}) : super(key: key);

  // ignore: prefer_typing_uninitialized_variables
  final data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.teal,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
        ),
        title: Text(
          data.name,
          style: const TextStyle(letterSpacing: 1, fontFamily: 'Cairo'),
        ),
        elevation: 0,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Hero(
                tag: 'location-${data.image}-${data.id}',
                child: Image(
                  image: AssetImage(data.image),
                  width: MediaQuery.of(context).size.width * 0.7,
                  height: MediaQuery.of(context).size.height * 0.3,
                ),
              ),
            ),
          ),
          Card(
            elevation: 20,
            child: Container(
              width: MediaQuery.of(context).size.width * .7,
              height: MediaQuery.of(context).size.height * 0.5,
              margin: const EdgeInsets.symmetric(horizontal: 25),
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Text(
                      data.name,
                      style: const TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: 22,
                          color: Colors.teal,
                          letterSpacing: 1,
                          fontFamily: 'Cairo'),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Text(
                      data.step,
                      style: const TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
