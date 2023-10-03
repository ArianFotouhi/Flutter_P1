import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'reusable_container.dart';
import 'icon_content.dart';
import 'constants.dart';

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
              Slider(
                  value: height.toDouble(),
                  min: 120,
                  max: 220,
                  activeColor: Color(0xFFEB1555),
                  inactiveColor: Color(0xFF8D8E98),
                  onChanged: (double value) {
                    setState(() {
                      height = value.round();
                    });
                  })
            ]),
          )),
          Expanded(
              child: Row(
            children: [
              Expanded(child: ReusableContainer(colour: kActiveCardColor)),
              Expanded(child: ReusableContainer(colour: kActiveCardColor))
            ],
          )),
          Container(
            color: kBottomContainerColor,
            margin: EdgeInsets.only(top: 10),
            width: double.infinity,
            height: kBottomContainerHeight,
          )
        ],
      ),
    );
  }
}
