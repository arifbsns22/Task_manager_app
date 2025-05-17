import 'package:flutter/material.dart';
import 'package:task_management/ui/screens/splash_screen.dart';

class TaskManagerApp extends StatefulWidget {
  const TaskManagerApp({super.key});

  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  @override
  State<TaskManagerApp> createState() => _TaskManagerAppState();
}

class _TaskManagerAppState extends State<TaskManagerApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: TaskManagerApp.navigatorKey,
      theme: ThemeData(
          colorSchemeSeed: Colors.deepOrange,
          inputDecorationTheme: InputDecorationTheme(
            hintStyle: TextStyle(
              fontWeight: FontWeight.w400,
              color: Colors.grey,
            ),
            fillColor: Colors.white,
            filled: true,
            contentPadding: EdgeInsets.symmetric(horizontal: 16),
            border: _getZeroBorder(),
            enabledBorder: _getZeroBorder(),
            errorBorder: _getZeroBorder(),
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
                fixedSize: Size.fromWidth(double.maxFinite),
                elevation: 7,
                backgroundColor: Colors.deepOrange,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8))),
          ),
          textTheme: const TextTheme(
            titleLarge: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
          )),
      home: const SplashScreen(),
    );
  }

  OutlineInputBorder _getZeroBorder() {
    return const OutlineInputBorder(
      borderSide: BorderSide.none,
    );
  }
}
