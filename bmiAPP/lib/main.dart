import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'reusable_container.dart';
import 'icon_content.dart';

const BottomContainerHeight = 80.0;
const activeContainerColor = Color(0xff323458);
const bottomContainerColor = Color(0xffff3471);

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
                  child: ReusableContainer(
                      colour: activeContainerColor,
                      cardChild: IconContent(
                        icon: FontAwesomeIcons.mars,
                        label: 'Male',
                      ))),
              Expanded(
                child: ReusableContainer(
                    colour: activeContainerColor,
                    cardChild: IconContent(
                      icon: FontAwesomeIcons.venus,
                      label: 'Female',
                    )),
              )
            ],
          )),
          Expanded(child: ReusableContainer(colour: activeContainerColor)),
          Expanded(
              child: Row(
            children: [
              Expanded(child: ReusableContainer(colour: activeContainerColor)),
              Expanded(child: ReusableContainer(colour: activeContainerColor))
            ],
          )),
          Container(
            color: bottomContainerColor,
            margin: EdgeInsets.only(top: 10),
            width: double.infinity,
            height: BottomContainerHeight,
          )
        ],
      ),
    );
  }
}
