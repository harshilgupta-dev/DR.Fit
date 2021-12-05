import 'package:flutter/material.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent,
        title: const Text('About Us'),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Column(
          children: const [
            Text(
              'DR.FIT is a mobile application that helps users to plan exercise according to days, chat  with the instructor, and also they can buy fitness products according to their needs. We will  also be adding yoga and meditation features by which users can plan their meditation and  yoga according to desired days. Exercises, yoga, and meditation are well planned in this  application. It goes from beginner to advanced levels and the user will not feel this  transition gap and can do it smoothly.',
              textAlign: TextAlign.justify,
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 50,
            ),
            Text(
                'It also calculates the BMI (Body Mass Index) of the user which helps the user to know  how much he/she has to lose or gain weight according to his/her personality. DR.Fit is  highly secure because we are using Google authentication by which users can log in and  sign up to the application easily and securely. By the feature of chatting with the instructor,  the user can interact one-to-one with the instructor and can resolve his/her doubts and  problems. ',
                textAlign: TextAlign.justify,
                style: TextStyle(fontWeight: FontWeight.w500))
          ],
        ),
      ),
    );
  }
}
