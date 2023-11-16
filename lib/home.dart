import "package:flutter/material.dart";
import "BottomNavigation.dart";
class TaskList extends StatefulWidget {
  const TaskList({super.key});

  @override
  State<TaskList> createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  @override
  Widget build(BuildContext context) {
    MediaQuery.of(context).platformBrightness == Brightness.dark?"Dark Theme":"Light Theme";
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home',
            style: TextStyle(color: Colors.white,)
        ),
      ),
      bottomNavigationBar: const BottomNavigation(),
      body: Center(
        child: Text("Hello"),
      )
    );
  }
}
