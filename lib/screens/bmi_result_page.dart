import 'package:dr_fit/helpers/shared_prefrences.dart';
import 'package:dr_fit/models/overweight.dart';
import 'package:dr_fit/models/underweight.dart';
import 'package:dr_fit/screens/diet_recommendation_screen.dart';
import 'package:dr_fit/widgets/new_elevated_button.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../utils/bmi_constants.dart';
import '../bmi_components/reusable_card.dart';
import 'package:flutter/material.dart';
import '../bmi_components/bottom_button.dart';

// ignore: must_be_immutable
class ResultPage extends StatelessWidget {
  ResultPage(
      {Key? key,
      required this.bmiResult,
      required this.interpretation,
      required this.resultText})
      : super(key: key);

  final String bmiResult;
  final SharedPrefrencesHelper _prefrencesHelper = SharedPrefrencesHelper();
  final String resultText;
  final String interpretation;

  @override
  Widget build(BuildContext context) {
    final List data;
    _prefrencesHelper.setStringInPrefrences('resultText', resultText);
    if (resultText == 'Underweight') {
      data = underWeightList;
    } else if (resultText == 'Overweight') {
      data = overWeightList;
    } else if (resultText == 'Normal') {
      data = overWeightList;
    } else {
      data = underWeightList;
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber[400],
        title: const Text('BMI Calculator'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: Container(
              alignment: Alignment.center,
              child: const Text(
                'Your Result',
                style: kTitleTextStyle,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: ResuableCard(
              onPress: () {},
              colour: kActiveCardColour,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    resultText.toUpperCase(),
                    style: kResultTextStyle,
                  ),
                  Text(
                    bmiResult,
                    style: kBMITextStyle,
                  ),
                  Text(
                    interpretation,
                    style: kBodyTextStyle,
                    textAlign: TextAlign.center,
                  ),
                  NewElevatedButton(
                      press: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (ctx) =>
                                DietRecommendationScreen(data: data)));
                      },
                      color: Colors.amber.shade400,
                      icon: FontAwesomeIcons.arrowRight,
                      label: 'Diet Recomendtion'),
                ],
              ),
            ),
          ),
          BottomButton(
              onTap: () {
                Navigator.pop(context);
              },
              buttonTitle: 'RE-CALCULATE')
        ],
      ),
    );
  }
}
