import 'package:dr_fit/models/excercise.dart';
import 'package:dr_fit/screens/excercise_description_screen.dart';
import 'package:flutter/material.dart';

class ExcerciseListScreen extends StatelessWidget {
  const ExcerciseListScreen({Key? key, required this.data}) : super(key: key);
  final List<Excercise> data;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Excercise'),
        elevation: 0,
      ),
      body: SafeArea(
        child: ListView.builder(
          itemCount: data.length,
          itemBuilder: (ctx, i) {
            return Card(
              child: ListTile(
                minVerticalPadding: 25,
                title: Text(
                  data[i].name,
                ),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (ctx) => ExcerciseDescriptionScreen(
                            data: data[i],
                          )));
                },
                trailing: SizedBox(
                  width: 65,
                  child: Hero(
                    tag: 'location-${data[i].image}-${data[i].id}',
                    child: Image(
                      image: AssetImage(data[i].image),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
