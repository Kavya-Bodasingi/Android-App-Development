import 'package:flutter/material.dart';

import 'change_theme_button.dart';

void main() => runApp(TaskManagerApp());

class Task {
  final String title;
  final String status;
  final String priority;

  Task({required this.title, required this.status, required this.priority});
}

class TaskManagerApp extends StatelessWidget {
  final List<Task> tasks = [
    Task(title: 'Task 1', status: 'In Progress', priority: 'High'),
    Task(title: 'Task 2', status: 'Completed', priority: 'Medium'),
    Task(title: 'Task 3', status: 'Pending', priority: 'Low'),
    // Add more tasks as needed
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TaskManagerScreen(tasks: tasks),
    );
  }
}

class TaskManagerScreen extends StatefulWidget {
  final List<Task> tasks;

  TaskManagerScreen({required this.tasks});

  @override
  _TaskManagerScreenState createState() => _TaskManagerScreenState();
}

class _TaskManagerScreenState extends State<TaskManagerScreen> {
  late TextEditingController _searchController;
  late String _selectedStatus;
  late String _selectedPriority;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
    _selectedStatus = 'All';
    _selectedPriority = 'All';
  }

  List<Task> _filteredTasks() {
    String searchTerm = _searchController.text.toLowerCase();
    return widget.tasks.where((task) {
      bool statusMatches = _selectedStatus == 'All' || task.status == _selectedStatus;
      bool priorityMatches = _selectedPriority == 'All' || task.priority == _selectedPriority;
      bool searchMatches = searchTerm.isEmpty || task.title.toLowerCase().contains(searchTerm);
      return statusMatches && priorityMatches && searchMatches;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Task Search',
          style: TextStyle(color: Colors.white,)
      ),
      actions:  [
        ChangeThemeButtonWidget(),
      ],

      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(16.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                labelText: 'Search by Task Title',
                suffixIcon: IconButton(
                  icon: Icon(Icons.clear),
                  onPressed: () {
                    _searchController.clear();
                  },
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              DropdownButton<String>(
                value: _selectedStatus,
                onChanged: (newValue) {
                  setState(() {
                    _selectedStatus = newValue!;
                  });
                },
                items: <String>['All', 'In Progress', 'Completed', 'Pending']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              DropdownButton<String>(
                value: _selectedPriority,
                onChanged: (newValue) {
                  setState(() {
                    _selectedPriority = newValue!;
                  });
                },
                items: <String>['All', 'High', 'Medium', 'Low']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ],
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _filteredTasks().length,
              itemBuilder: (context, index) {
                Task task = _filteredTasks()[index];
                return ListTile(
                  title: Text(task.title),
                  subtitle: Text('Status: ${task.status}, Priority: ${task.priority}'),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}