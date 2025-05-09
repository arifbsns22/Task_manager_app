import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:task_management/ui/screens/forgot_password_verify_email_screen.dart';
import 'package:task_management/ui/screens/login_screen.dart';
import 'package:task_management/ui/screens/register_screen.dart';
import 'package:task_management/ui/widgets/screen_background.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final TextEditingController _newPasswordTEController =
      TextEditingController();
  final TextEditingController _confirmPasswordTEController =
      TextEditingController();
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
                "Set Your New Password...",
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 3),
              Text(
                "Minimum lenght password 8 character with later and number combinations",
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: Colors.blueGrey,
                    ),
              ),
              const SizedBox(height: 24),
              TextFormField(
                controller: _newPasswordTEController,
                textInputAction: TextInputAction.next,
                decoration: const InputDecoration(
                  hintText: "New Possword",
                ),
              ),
              const SizedBox(height: 24),
              TextFormField(
                controller: _confirmPasswordTEController,
                decoration: const InputDecoration(
                  hintText: "Confirm Password",
                ),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                  onPressed: _onTapSubmitButton, child: Text("Confirm")),
              const SizedBox(height: 35),
              Center(
                child: Column(
                  children: [
                    RichText(
                      text: TextSpan(
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
                            recognizer: TapGestureRecognizer()
                              ..onTap = _onTapSignInButton,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
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
        builder: (context) => const LoginScreen(),
      ),
    );
  }

  void _onTapSubmitButton() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const LoginScreen(),
      ),
    );
  }

  void dispose() {
    _newPasswordTEController.dispose();
    _confirmPasswordTEController.dispose();
    super.dispose();
  }
}
