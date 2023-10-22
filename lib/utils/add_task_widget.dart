import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/task_providers.dart';
import 'edit_task_widget.dart';

class TaskAddView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: Icon(Icons.add),
      onPressed: () {
        // Show a dialog to add a new task
        showDialog(
          context: context,
          builder: (context) {
            return TaskDialog(
              title: 'Add Task',
              initialTask: null,
              onSave: (newTask) {
                // Use Provider to access the TaskList model and add the new task
                Provider.of<TaskList>(context, listen: false).addTask(newTask);
                Navigator.pop(context);
              },
            );
          },
        );
      },
    );
  }
}
