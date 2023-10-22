import 'package:flutter/material.dart';

import '../models/tasks.dart';

class TaskDialog extends StatefulWidget {
  final String title;
  final Task? initialTask;
  final Function onSave;

  TaskDialog({required this.title, this.initialTask, required this.onSave});

  @override
  _TaskDialogState createState() => _TaskDialogState();
}

class _TaskDialogState extends State<TaskDialog> {
  late TextEditingController _titleController;
  late TextEditingController _categoryController;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(
        text: widget.initialTask != null ? widget.initialTask!.title : '');
    _categoryController = TextEditingController(
        text: widget.initialTask != null ? widget.initialTask!.category : '');
  }

  @override
  void dispose() {
    _titleController.dispose();
    _categoryController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(widget.title),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: _titleController,
            decoration: InputDecoration(labelText: 'Title'),
          ),
          TextField(
            controller: _categoryController,
            decoration: InputDecoration(labelText: 'Category'),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            // Create a new task from the input fields
            Task newTask = Task(
              title: _titleController.text,
              category: _categoryController.text,
              isDone: widget.initialTask != null ? widget.initialTask!.isDone : false,
            );
            // Call the onSave function with the new task
            widget.onSave(newTask);
          },
          child: Text('Save'),
        ),
      ],
    );
  }
}
