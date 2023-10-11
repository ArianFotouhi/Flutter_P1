class Task {
  final String name;
  bool isDone;

  Task({required this.name, this.isDone = false}); // Semicolon here

  void toggleDone() {
    isDone = !isDone;
  }
}
