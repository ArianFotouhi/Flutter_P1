import 'package:flutter/material.dart';
import '../models/task.dart';
import '../models/task_data.dart';
import 'package:provider/provider.dart';


class AddTaskScreen extends StatelessWidget {
  final Function addTaskCallBack; // Define the callback as a class field

  AddTaskScreen(
      {required this.addTaskCallBack}); // Use the constructor to set the callback

  @override
  Widget build(BuildContext context) {
    String newTaskTitle = ''; // Initialize with an empty string

    return Container(
      color: Color(0xff757575),
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text('Add Task',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 30, color: Colors.lightBlueAccent)),
            TextField(
              autofocus: true,
              textAlign: TextAlign.center,
              onChanged: (newText) {
                newTaskTitle = newText;
              },
            ),
            TextButton(
              onPressed: () {
                // Call the callback function when the button is pressed
               Provider.of<TaskData>(context, listen: false).addTask(newTaskTitle);
               Navigator.pop(context);
              },
              child: Text(
                'Add',
                style: TextStyle(color: Colors.lightBlueAccent),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
