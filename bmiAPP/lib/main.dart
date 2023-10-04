import 'dart:html';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'components/reusable_container.dart';
import 'components/icon_content.dart';
import 'constants.dart';
import 'screens/results_page.dart';
import 'components/bottom_button.dart';
import 'components/round_icon_button.dart';
import 'calculator_brain.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,

        // Define the default brightness and colors.
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
          // TRY THIS: Change to "Brightness.light"
          //           and see that all colors change
          //           to better contrast a light background.
          brightness: Brightness.dark,
        ),
      ),
      home: InputPage(),
    );
  }
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  int height = 180;
  int weight = 60;
  int age = 25;

  Color maleCardColor = kInactiveCardColor;
  Color femaleCardColor = kInactiveCardColor;
  void updateColor(String gender) {
    if (gender == 'man') {
      if (maleCardColor == kActiveCardColor) {
        maleCardColor = kInactiveCardColor;
      } else {
        maleCardColor = kActiveCardColor;
      }
      femaleCardColor = kInactiveCardColor;
    } else {
      if (femaleCardColor == kActiveCardColor) {
        femaleCardColor = kInactiveCardColor;
      } else {
        femaleCardColor = kActiveCardColor;
      }
      maleCardColor = kInactiveCardColor;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        children: [
          Expanded(
              child: Row(
            children: [
              Expanded(
                child: GestureDetector(
                    onTap: () {
                      setState(() {
                        updateColor('man');
                      });
                    },
                    child: ReusableContainer(
                        colour: maleCardColor,
                        cardChild: IconContent(
                          icon: FontAwesomeIcons.mars,
                          label: 'Male',
                        ))),
              ),
              Expanded(
                  child: GestureDetector(
                onTap: () {
                  setState(() {
                    updateColor('female');
                  });
                },
                child: ReusableContainer(
                    colour: femaleCardColor,
                    cardChild: IconContent(
                      icon: FontAwesomeIcons.venus,
                      label: 'Female',
                    )),
              )),
            ],
          )),
          Expanded(
              child: ReusableContainer(
            colour: kActiveCardColor,
            cardChild:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text('Height', style: kLabelTextStyle),
              Row(
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    height.toString(),
                    style: kNumberTextStyle,
                  ),
                  Text('cm', style: kLabelTextStyle),
                ],
              ),
              SliderTheme(
                data: SliderTheme.of(context).copyWith(
                    activeTrackColor: Colors.white,
                    thumbColor: Color(0xFFEB1555),
                    overlayColor: Color(0x29EB1555),
                    thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15),
                    overlayShape: RoundSliderOverlayShape(overlayRadius: 30)),
                child: Slider(
                    value: height.toDouble(),
                    min: 120,
                    max: 220,
                    inactiveColor: Color(0xFF8D8E98),
                    onChanged: (double value) {
                      setState(() {
                        height = value.round();
                      });
                    }),
              )
            ]),
          )),
          Expanded(
              child: Row(
            children: [
              Expanded(
                  child: ReusableContainer(
                colour: kActiveCardColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Weight',
                      style: kLabelTextStyle,
                    ),
                    Text(
                      weight.toString(),
                      style: kNumberTextStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RoundIconButton(
                          icon: FontAwesomeIcons.plus,
                          onPressed: () {
                            setState(() {
                              weight++;
                            });
                          },
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        RoundIconButton(
                            icon: FontAwesomeIcons.minus,
                            onPressed: () {
                              setState(() {
                                weight--;
                              });
                            }),
                      ],
                    )
                  ],
                ),
              )),
              Expanded(
                  child: ReusableContainer(
                colour: kActiveCardColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Age',
                      style: kLabelTextStyle,
                    ),
                    Text(
                      age.toString(),
                      style: kNumberTextStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RoundIconButton(
                          icon: FontAwesomeIcons.plus,
                          onPressed: () {
                            setState(() {
                              age++;
                            });
                          },
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        RoundIconButton(
                            icon: FontAwesomeIcons.minus,
                            onPressed: () {
                              setState(() {
                                age--;
                              });
                            }),
                      ],
                    )
                  ],
                ),
              ))
            ],
          )),
          BottomButton(
            onTap: () {
              CalculatorBrain calc =
                  CalculatorBrain(height: height, weight: weight);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) {
                  return ResultsPage(
                    bmiResults: calc.calculateBMI(),
                    resultText: calc.getResults(),
                    interpret: calc.getInterpret(),
                  );
                }),
              );
            },
            buttonTitle: 'Calculate',
          )
        ],
      ),
    );
  }
}
