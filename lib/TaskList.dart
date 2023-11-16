import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'BottomNavigation.dart';
import 'change_theme_button.dart';
class Task {
  String title;
  String category;
  String priority;
  DateTime dueDate;
  bool isCompleted;

  Task(this.title, this.category, this.priority, this.dueDate, this.isCompleted);
}
class SearchTaskLists extends StatefulWidget {
  const SearchTaskLists({super.key});

  @override
  State<SearchTaskLists> createState() => _SearchTaskListsState();
}

class _SearchTaskListsState extends State<SearchTaskLists> {
  List<Task> tasks = [];

  void _addTask(String taskTitle, String category, String priority,
      DateTime dueDate) {
    setState(() {
      tasks.add(Task(taskTitle, category, priority, dueDate, false));
    });
  }

  Future<void> _selectDate(BuildContext context) async {
    DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2030),
    );

    if (selectedDate != null && selectedDate != DateTime.now()) {
      _addTask('Task with Due Date', 'General', 'Medium', selectedDate);
    }
  }

  @override
  Widget build(BuildContext context) {
   MediaQuery.of(context).platformBrightness == Brightness.dark?"Dark Theme":"Light Theme";
    return Scaffold(
      appBar: AppBar(
      title:const Text("Task Manager"),
    actions:  [
    ChangeThemeButtonWidget(),
    ],
      ),
body: ListView.builder(
itemCount: tasks.length,
itemBuilder: (context, index) {
var task = tasks[index];
return ListTile(
title: Text(task.title),
subtitle: Text('Category: ${task.category}, Priority: ${task
    .priority}, Due Date: ${DateFormat('yyyy-MM-dd').format(
task.dueDate)}'),
leading: Checkbox(
value: task.isCompleted,
onChanged: (bool? value) {
setState(() {
task.isCompleted = value ?? false;
});
},
),
);
},
),
floatingActionButton: FloatingActionButton(
onPressed: () {
showDialog(
context: context,
builder: (BuildContext context) {
return AlertDialog(
title: const Text('Add Task'),
content: Column(
mainAxisSize: MainAxisSize.min,
children: <Widget>[
TextField(
decoration: const InputDecoration(labelText: 'Task Title'),
onChanged: (value) {},
),
TextField(
decoration: const InputDecoration(labelText: 'Category'),
onChanged: (value) {},
),
TextField(
decoration: const InputDecoration(labelText: 'Priority'),
onChanged: (value) {},
),
ElevatedButton(
onPressed: () => _selectDate(context),
child: const Text('Select Due Date'),
),
],
),
actions: <Widget>[
ElevatedButton(
child: const Text('Add'),
onPressed: () {
// Retrieve values from TextFields and add the task
_addTask(
'Task Title', 'General', 'Medium', DateTime.now());
Navigator.of(context).pop();
},
),
],
);
},
);
},
child: const Icon(Icons.add),
),
      bottomNavigationBar: const BottomNavigation(),);
  }
}