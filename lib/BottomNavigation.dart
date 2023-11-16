import 'package:flutter/material.dart';
import 'package:major_project/TaskList.dart';
import 'Login.dart';
import "LogOut.dart";
import 'Settings.dart';
import 'search_manage.dart';
import 'home.dart';
import 'Profile.dart';
class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});
  @override

 State<BottomNavigation> createState() => _BottomNavigationState();
}
class _BottomNavigationState extends State<BottomNavigation> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const TaskList(),
     const SearchTaskLists(),
    TaskManagerApp(),
    const Profile(),
    const Settings(),
   const  Login(),
    const LogOut(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Task Remainder"),
        ),

        body: _pages[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          items:  const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home, color: Colors.blue),
              label:
                'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.add_task,color: Colors.blue),
              label: 'TaskList',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search,color: Colors.blue),
              label: 'Search TaskList',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person,color: Colors.blue),
              label: 'Profile',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings,color: Colors.blue),
              label: 'Settings',
            ),
          BottomNavigationBarItem(
            icon: Icon(Icons.login_outlined,color: Colors.blue),
            label: 'Login',
          ),
            BottomNavigationBarItem(
              icon: Icon(Icons.logout_outlined,color: Colors.blue),
              label: 'LogOut',
            ),
          ],
          currentIndex: _currentIndex,
          onTap: _onItemTapped,
        ),
    );
  }
}
//void main() => runApp(const BottomNavigation());