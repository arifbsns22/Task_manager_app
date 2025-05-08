import 'package:flutter/material.dart';
import 'package:task_management/ui/widgets/screen_background.dart';

import '../utills/assets_path.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ScreenBackground(
            child: Padding(
      padding: const EdgeInsets.all(32.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 80),
          Text(
            "Get Started With Ayat Tech Solution...",
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 24),
          TextFormField(
            decoration: const InputDecoration(
              hintText: " Enter Your Email",
            ),
          ),
          const SizedBox(height: 10),
          TextFormField(
            decoration: const InputDecoration(
              hintText: " Enter Your Possword",
            ),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
              onPressed: () {}, child: Icon(Icons.arrow_circle_right_outlined)),
          const SizedBox(height: 35),
          Center(
            child: Column(
              children: [
                TextButton(
                    onPressed: () {}, child: const Text("Forgot Password ?")),
                const SizedBox(height: 10),
                RichText(
                  text: const TextSpan(
                    style: TextStyle(
                      color: Colors.black54,
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                    ),
                    children: [
                      TextSpan(text: "Don't Have Account? "),
                      TextSpan(
                        text: "Sign In",
                        style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                /*const SizedBox(height: 50),
                TextButton(onPressed: () {}, child: const Text("Need Support ?")),
                */
              ],
            ),
          )
        ],
      ),
    )));
  }
}
