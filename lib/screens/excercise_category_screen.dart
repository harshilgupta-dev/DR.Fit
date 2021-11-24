import 'package:dr_fit/models/excercise.dart';
import 'package:dr_fit/models/excercise_category.dart';
import 'package:dr_fit/screens/excercise_list_screen.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ExcerciseCategoryScreen extends StatelessWidget {
  const ExcerciseCategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Excercise'),
        elevation: 0,
      ),
      body: GridView.builder(
          padding: const EdgeInsets.all(10),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 3 / 2,
            mainAxisExtent: 120,
            mainAxisSpacing: 30,
            crossAxisSpacing: 10,
          ),
          itemCount: excercises.length,
          itemBuilder: (ctx, i) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: InkWell(
                borderRadius: BorderRadius.circular(20),
                overlayColor: MaterialStateProperty.all(Colors.black),
                onTap: () {
                  List<Excercise> newData = [];
                  newData = excerciseList.fold(excerciseList,
                      (previousValue, element) {
                    if (element.category == excercises[i].title) {
                      newData.add(element);
                    }
                    return newData;
                  });
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (ctx) => ExcerciseListScreen(
                            data: newData,
                          )));
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.black87,
                    image: DecorationImage(
                        colorFilter: ColorFilter.mode(
                            Colors.black.withOpacity(0.3), BlendMode.dstATop),
                        fit: BoxFit.cover,
                        image: CachedNetworkImageProvider(
                          excercises[i].image,
                        )),
                  ),
                  child: Center(
                      child: Text(
                    excercises[i].title.toUpperCase(),
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  )),
                ),
              ),
            );
          }),
    );
  }
}
