import 'package:dr_fit/screens/description_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ListScreen extends StatelessWidget {
  const ListScreen({Key? key, required this.data}) : super(key: key);
  final List data;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(247, 247, 247, .96),
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
        ),
        backgroundColor: Colors.teal,
        title: Text(data[0].category.toUpperCase()),
        elevation: 0,
      ),
      body: SafeArea(
        child: ListView.builder(
          padding: const EdgeInsets.all(8),
          itemCount: data.length,
          itemBuilder: (ctx, i) {
            return Card(
              margin: const EdgeInsets.symmetric(vertical: 8),
              elevation: 10,
              child: ListTile(
                minVerticalPadding: 25,
                title: Text(
                  data[i].name,
                  style: const TextStyle(fontWeight: FontWeight.w500),
                ),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (ctx) => DescriptionScreen(
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
