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
    return  Scaffold(
      body: ScreenBackground(child: 
      Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 80),
            Text("Get Started With", style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w600
            ),),
            const SizedBox(height: 24),
            TextFormField(
              decoration:const InputDecoration(
                hintText: " Enter Your Email",

              ),
            ),
            const SizedBox(height: 10),
            TextFormField(
              decoration:const InputDecoration(
                hintText: " Enter Your Possword",

              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton(onPressed: (){}, child:Icon(Icons.arrow_circle_right_outlined)),
          ],
        ),
      )
      )
    );
  }
}
