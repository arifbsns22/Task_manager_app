import 'package:flutter/material.dart';
import 'package:task_management/ui/screens/cancelled_task_screen.dart';
import 'package:task_management/ui/screens/completed_task_screen.dart';
import 'package:task_management/ui/screens/new_task_screen.dart';
import 'package:task_management/ui/screens/progress_task_screen.dart';

import '../widgets/tm_app_bar.dart';

class MainBottomNavScreen extends StatefulWidget {
  const MainBottomNavScreen({super.key});

  @override
  State<MainBottomNavScreen> createState() => _MainBottomNavScreenState();
}

class _MainBottomNavScreenState extends State<MainBottomNavScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screen = const [
    NewTaskScreen(),
    ProgressTaskScreen(),
    CompletedTaskScreen(),
    CancelledTaskScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TMAppBar(),
      body: _screen[_selectedIndex],
      bottomNavigationBar: NavigationBar(

        selectedIndex: _selectedIndex,
        onDestinationSelected: (index) {
          _selectedIndex = index;
          setState(() {});
        },
        destinations: const [
          NavigationDestination(
              icon: Icon(Icons.table_chart, color: Color(0xFF0E104B)),
              label: 'New'),
          NavigationDestination(
              icon: Icon(Icons.auto_graph, color: Color(0xFF0E104B)),
              label: 'Progress'),
          NavigationDestination(
              icon: Icon(Icons.done_all, color: Color(0xFF0E104B)),
              label: 'Complete'),
          NavigationDestination(
              icon: Icon(Icons.highlight_off, color: Color(0xFF0E104B)),
              label: 'Cancelled')
        ],
      ),
    );
  }
}
