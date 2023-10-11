import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text('this is a task'),
      trailing: Checkbox(
        onChanged: null,
        value: false,
      ),
    );
  }
}
