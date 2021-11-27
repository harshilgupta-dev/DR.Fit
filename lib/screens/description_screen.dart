import 'package:dr_fit/models/excercise.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DescriptionScreen extends StatelessWidget {
  const DescriptionScreen({Key? key, required this.data}) : super(key: key);

  final Excercise data;

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
          Center(
            child: Hero(
              tag: 'location-${data.image}-${data.id}',
              child: Image(
                image: AssetImage(data.image),
                height: MediaQuery.of(context).size.height * 0.3,
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
