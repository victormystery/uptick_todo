import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/task_providers.dart';
import '../utils/edit_task_widget.dart';
import '../utils/task_widget.dart';

class TaskListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Consumer<TaskList>(
        builder: (context, taskList, child) {
          return ListView.builder(
            itemCount: taskList.tasks.length,
            itemBuilder: (context, index) {
              final task = taskList.tasks[index];
              return TaskItem(
                task: task,
                onEdit: () {
                  // Show a dialog to edit the task
                  showDialog(
                    context: context,
                    builder: (context) {
                      return TaskDialog(
                        title: 'Edit Task',
                        initialTask: task,
                        onSave: (newTask) {
                         
                          Provider.of<TaskList>(context, listen: false)
                              .updateTask(newTask);
                          Navigator.pop(context);
                        },
                      );
                    },
                  );
                },
                onDelete: () {
                  // Use Provider to access the TaskList model and remove the task
                  Provider.of<TaskList>(context, listen: false)
                      .removeTask(task);
                },
              );
            },
          );
        },
      ),
    );
  }
}
