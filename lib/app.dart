import 'package:flutter/material.dart';
import 'package:task_management/ui/screens/splash_screen.dart';

class TaskManagerApp extends StatelessWidget {
  const TaskManagerApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          inputDecorationTheme: const InputDecorationTheme(
        hintStyle: TextStyle(
          fontWeight: FontWeight.w400,
          color: Colors.grey,
        ),
        fillColor: Colors.white,
        filled: true,
        contentPadding: EdgeInsets.symmetric(horizontal: 16),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
        ),
      )),
      home: const SplashScreen(),
    );
  }
}
