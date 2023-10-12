//import 'package:provider/provider.dart';
import 'package:flutter/foundation.dart';
import '../models/task.dart';

class TaskData extends ChangeNotifier{

  List<Task> tasks = [
    Task(name: 'Buy Milk'),
    Task(name: 'Buy Orange'),
    Task(name: 'Buy Cheese'),
  ];
int get taskCount {
  return tasks.length;
}

void addTask(String newTaskTitle){
  final task = Task(name: newTaskTitle);
  tasks.add(task);
  notifyListeners();
}
}