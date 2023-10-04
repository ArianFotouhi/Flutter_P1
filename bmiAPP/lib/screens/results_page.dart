import 'package:flutter/material.dart';

import 'package:diceflutter/constants.dart';
import '../components/reusable_container.dart';
import '../components/bottom_button.dart';

class ResultsPage extends StatelessWidget {
  ResultsPage(
      {required this.bmiResults,
      required this.resultText,
      required this.interpret});

  final String bmiResults;
  final String resultText;
  final String interpret;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
      ),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.all(15),
                alignment: Alignment.bottomLeft,
                child: Text(
                  'Your Result',
                  style: kTitleTextStyle,
                ),
              ),
            ),
            Expanded(
                flex: 5,
                child: ReusableContainer(
                  colour: kActiveCardColor,
                  cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          resultText.toUpperCase(),
                          style: kResultTextStyle,
                        ),
                        Text(
                          bmiResults,
                          style: kBMITextStyle,
                        ),
                        Text(
                          interpret,
                          textAlign: TextAlign.center,
                          style: kBodyTextStyle,
                        ),
                        BottomButton(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            buttonTitle: 'Re-Calculate')
                      ]),
                ))
          ]),
    );
  }
}
