import 'package:email_validator/email_validator.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:task_management/ui/widgets/screen_background.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _emailTEController = TextEditingController();
  final TextEditingController _firstNamelTEController = TextEditingController();
  final TextEditingController _lastNameTEController = TextEditingController();
  final TextEditingController _mobileTEController = TextEditingController();
  final TextEditingController _passwordTEController = TextEditingController();
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
                "Join With Ayat Tech Solution...",
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 24),

              //----------------------Form Start--------------------------//
              TextFormField(
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.emailAddress,
                controller: _emailTEController,
                decoration: const InputDecoration(
                  hintText: "Email",
                ),
                validator: (String? value) {
                  String email = value?.trim() ?? '';
                  if (EmailValidator.validate(email) == false) {
                    return 'Enter a valid email';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              TextFormField(
                textInputAction: TextInputAction.next,
                controller: _firstNamelTEController,
                decoration: const InputDecoration(
                  hintText: "First Name",
                ),
                validator: (String? value) {
                  if (value?.trim().isEmpty ?? true) {
                    return 'Enter first name';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              TextFormField(
                textInputAction: TextInputAction.next,
                controller: _lastNameTEController,
                decoration: const InputDecoration(
                  hintText: "Last Name",
                ),
                validator: (String? value) {
                  if (value?.trim().isEmpty ?? true) {
                    return 'Enter your last name';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              TextFormField(
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.phone,
                controller: _mobileTEController,
                decoration: const InputDecoration(
                  hintText: "Mobile Number",
                ),
                validator: (String? value) {
                  String phone = value?.trim() ?? '';
                  RegExp regExp = RegExp(r"^(?:\\+88|88)?(01[3-9]\\d{8})$");
                  if (regExp.hasMatch(phone) == false) {
                    return 'Enter a valid number';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              TextFormField(
                textInputAction: TextInputAction.next,
                controller: _passwordTEController,
                decoration: const InputDecoration(
                  hintText: "Password",
                ),
                validator: (String? value) {
                  if ((value?.isEmpty ?? true) || (value!.length < 6)) {
                    return 'Enter your password more than 6 letters';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                  onPressed: _onTapSubmitButton,
                  child: Icon(Icons.arrow_circle_right_outlined)),

              //----------------------Form Start--------------------------//

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
                      TextSpan(text: "Already Have an Account ? "),
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

  void _onTapSubmitButton() {
    if (_formKey.currentState!.validate()) {
      _registerUser();
    }
  }

  Future<void> _registerUser() async {}
  void _onTapSignInButton() {
    Navigator.pop(context);
  }

  @override
  void dispose() {
    _emailTEController.dispose();
    _firstNamelTEController.dispose();
    _lastNameTEController.dispose();
    _mobileTEController.dispose();
    _passwordTEController.dispose();
    super.dispose();
  }
}
