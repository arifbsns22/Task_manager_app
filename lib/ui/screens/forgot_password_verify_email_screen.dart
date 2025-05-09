import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:task_management/ui/screens/forgot_password_pin_verification_screen.dart';

import 'package:task_management/ui/widgets/screen_background.dart';

import '../utills/assets_path.dart';

class ForgotPasswordVerifyEmailScreen extends StatefulWidget {
  const ForgotPasswordVerifyEmailScreen({super.key});

  @override
  State<ForgotPasswordVerifyEmailScreen> createState() =>
      _ForgotPasswordVerifyEmailScreenState();
}

class _ForgotPasswordVerifyEmailScreenState
    extends State<ForgotPasswordVerifyEmailScreen> {
  final TextEditingController _emailTEController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ScreenBackground(
            child: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 80),
              Text(
                "Enter Your Email Address.....",
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 3),
              Text(
                "A 6 digit verification pin will send to your email adress",
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: Colors.blueGrey,
                ),
              ),
              const SizedBox(height: 24),
              TextFormField(
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.emailAddress,
                controller: _emailTEController,
                decoration: const InputDecoration(
                  hintText: " Enter Your Email",
                ),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                  onPressed: _onTapSubmitButton,
                  child: Icon(Icons.arrow_circle_right_outlined)),
              const SizedBox(height: 35),
              Center(
                child: RichText(
                  text: TextSpan(
                    style: TextStyle(
                      color: Colors.black54,
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                    ),
                    children: [
                      TextSpan(text: "Have Account ? "),
                      TextSpan(
                        text: "Sign In",
                        style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = _onTapSigninButton,
                      ),
                    ],
                  ),
                ),
                /*const SizedBox(height: 50),
                                        TextButton(onPressed: () {}, child: const Text("Need Support ?")),
                                        */
              )
            ],
          ),
        ),
      ),
    )));
  }

  void _onTapSignInButton() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const ForgotPasswordVerifyEmailScreen(),
      ),
    );
  }

  void _onTapSubmitButton () {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const ForgotPasswordPinVerificationScreen(),
      ),
    );
  }

  void _onTapSigninButton() {
    Navigator.pop(context);
  }
  @override
  void dispose() {
    _emailTEController.dispose();
    super.dispose();
  }



}
