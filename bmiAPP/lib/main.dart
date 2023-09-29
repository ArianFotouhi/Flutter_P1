import 'package:flutter/material.dart';

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
                colour: Color(0xff323458),
              )),
              Expanded(child: ReusableContainer(colour: Color(0xff323458)))
            ],
          )),
          Expanded(child: ReusableContainer(colour: Color(0xff323458))),
          Expanded(
              child: Row(
            children: [
              Expanded(child: ReusableContainer(colour: Color(0xff323458))),
              Expanded(child: ReusableContainer(colour: Color(0xff323458)))
            ],
          )),
        ],
      ),
    );
  }
}

class ReusableContainer extends StatelessWidget {
  ReusableContainer({required this.colour});
  final Color? colour;
  @override
  Widget build(BuildContext context) {
    // Implement the widget's UI by returning a widget tree
    return Container(
      margin: const EdgeInsets.all(15),
      decoration: BoxDecoration(
          color: colour ?? Colors.transparent,
          borderRadius: BorderRadius.circular(10)),
    );
  }
}
