import 'package:flutter/material.dart';

class ContactUsScreen extends StatelessWidget {
  const ContactUsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ImageProvider _harsh = const AssetImage('assets/images/harsh.jpg');
    ImageProvider _harshil = const AssetImage('assets/images/harshil.jpg');
    ImageProvider _ishika = const AssetImage('assets/images/ishika.jpeg');
    return Scaffold(
      backgroundColor: const Color.fromRGBO(247, 247, 247, .9),
      appBar: AppBar(
        title: const Text('Contact Us'),
        backgroundColor: const Color.fromRGBO(247, 247, 247, .9),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.6,
            width: double.infinity,
            child: ListView(
              physics: const BouncingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics()),
              padding: const EdgeInsets.all(8.0),
              shrinkWrap: false,
              scrollDirection: Axis.horizontal,
              children: [
                buildContainer(
                  context,
                  'Harsh Tripathi',
                  'APP DEVELOPER',
                  '+91 952-0423-518',
                  'harshtripathi9520@gmail.com',
                  _harsh,
                ),
                buildContainer(
                  context,
                  'Harshil Gupta',
                  'APP DEVELOPER',
                  '+91 844-5603-664',
                  'harshilgupta0099@gmail.com',
                  _harshil,
                ),
                buildContainer(
                  context,
                  'Ishika Agarwal',
                  'APP DEVELOPER',
                  '+91 639-572-940',
                  'ishika21022001@gmail.com',
                  _ishika,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

buildContainer(context, name, role, phone, mail, image) {
  return Card(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20),
    ),
    elevation: 7,
    color: const Color.fromRGBO(247, 247, 247, .9),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Container(
        color: const Color.fromRGBO(247, 247, 247, .9),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          CircleAvatar(
            radius: 55.0,
            backgroundColor: Colors.blue[800],
            backgroundImage: image,
            //backgroundImage: AssetImage('images/dev.jpg'),
          ),
          const SizedBox(
            height: 15,
          ),
          Text(
            name,
            style: TextStyle(
                fontSize: 30.0,
                color: Colors.grey[800],
                fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            role,
            style: TextStyle(
                color: Colors.grey[700],
                fontWeight: FontWeight.bold,
                letterSpacing: 2,
                fontSize: 15.0),
          ),
          SizedBox(
            height: 40.0,
            width: 150.0,
            child: Divider(
              color: Colors.grey[600],
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * .88,
            child: Card(
              elevation: 8.0,
              color: Colors.white,
              margin: const EdgeInsets.symmetric(horizontal: 50.0),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    Icon(
                      Icons.phone_outlined,
                      color: Colors.grey[600],
                    ),
                    const SizedBox(
                      width: 10.0,
                    ),
                    Text(
                      phone,
                      style: TextStyle(
                          color: Colors.grey[600], fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.88,
            child: Card(
              elevation: 8.0,
              color: Colors.white,
              margin:
                  const EdgeInsets.symmetric(horizontal: 50.0, vertical: 20.0),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    Icon(
                      Icons.mail_outline_rounded,
                      color: Colors.grey[600],
                    ),
                    const SizedBox(
                      width: 10.0,
                    ),
                    Expanded(
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.39,
                        child: FittedBox(
                          child: Text(
                            mail,
                            style: TextStyle(
                                color: Colors.grey[600],
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ]),
      ),
    ),
  );
}
