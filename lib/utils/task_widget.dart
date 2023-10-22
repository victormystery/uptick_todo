import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/tasks.dart';
import '../providers/task_providers.dart';

class TaskItem extends StatelessWidget {
  final Task task;
  final Function onEdit;
  final Function onDelete;

  TaskItem({required this.task, required this.onEdit, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(task.title),
      subtitle: Text(task.category),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () => onEdit(),
          ),
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: () => onDelete(),
          ),
        ],
      ),
      leading: Checkbox(
        value: task.isDone,
        onChanged: (value) {
          Provider.of<TaskList>(context, listen: false).updateTask(
            Task(
              title: task.title,
              category: task.category,
              isDone: value ?? false,
            ),
          );
        },
      ),
    );
  }
}
