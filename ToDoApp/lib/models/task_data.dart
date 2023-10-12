import 'dart:collection';
import 'package:flutter/foundation.dart';
import '../models/task.dart';

class TaskData extends ChangeNotifier{

  List<Task> _tasks = [
    Task(name: 'Buy Milk'),
    Task(name: 'Buy Orange'),
    Task(name: 'Buy Cheese'),
  ];

UnmodifiableListView<Task> get tasks {
  return UnmodifiableListView(_tasks);
}

int get taskCount {
  return _tasks.length;
}

void addTask(String newTaskTitle){
  final task = Task(name: newTaskTitle);
  _tasks.add(task);
  notifyListeners();
}

void updateTask(Task task){
  task.toggleDone();
  notifyListeners();

}

}