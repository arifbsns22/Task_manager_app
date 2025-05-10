import 'package:flutter/material.dart';
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

  final List<Widget> _screen = [
    NewTaskScreen(),
    ProgressTaskScreen(),
    NewTaskScreen(),
    NewTaskScreen(),
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
          NavigationDestination(icon: Icon(Icons.new_label), label: 'New'),
          NavigationDestination(
              icon: Icon(Icons.update_outlined), label: 'Progress'),
          NavigationDestination(icon: Icon(Icons.done_all), label: 'Complete'),
          NavigationDestination(
              icon: Icon(Icons.cancel_outlined), label: 'Cancelled')
        ],
      ),
    );
  }
}
