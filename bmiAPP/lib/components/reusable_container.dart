import 'package:flutter/material.dart';

class ReusableContainer extends StatelessWidget {
  ReusableContainer({required this.colour, this.cardChild});
  final Color? colour;
  final Widget? cardChild;
  @override
  Widget build(BuildContext context) {
    // Implement the widget's UI by returning a widget tree
    return Container(
      child: cardChild,
      margin: const EdgeInsets.all(15),
      decoration: BoxDecoration(
          color: colour ?? Colors.transparent,
          borderRadius: BorderRadius.circular(10)),
    );
  }
}
