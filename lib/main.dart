import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'providers/task_providers.dart';
import 'screens/task_screen.dart';
import 'utils/add_task_widget.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => TaskList(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
        body: TaskListWidget(),
        floatingActionButton: TaskAddView(),
      ),
    );
  }
}
