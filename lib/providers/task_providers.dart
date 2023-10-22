import 'package:flutter/material.dart';

import '../models/tasks.dart';

class TaskList extends ChangeNotifier {
  List<Task> _tasks = [];

  // Getter for the tasks list
  List<Task> get tasks => _tasks;

  // Add a new task to the list and notify listeners
  void addTask(Task task) {
    _tasks.add(task);
    notifyListeners();
  }

  // Remove a task from the list and notify listeners
  void removeTask(Task task) {
    _tasks.remove(task);
    notifyListeners();
  }

  // Update a task in the list and notify listeners
  void updateTask(Task task) {
    int index = _tasks.indexOf(task);
    if (index != -1) {
      _tasks[index] = task;
      notifyListeners();
    } else {
      // Handle the case where the task is not found in the list.
      print("Task not found in the list");
      // You can throw an exception, return a specific value, or take other actions as needed.
    }
  }
}
