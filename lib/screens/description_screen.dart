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
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
        ),
        title: Text(data.name),
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
                  height: MediaQuery.of(context).size.height * 0.3,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            data.name,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              decoration: TextDecoration.underline,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 25),
            child: Text(
              data.step,
            ),
          )
        ],
      ),
    );
  }
}
