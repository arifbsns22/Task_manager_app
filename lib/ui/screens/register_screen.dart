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
  final GlobalKey <FormState> _formKey = GlobalKey <FormState>();

//---------------------------Form Verify-----------------------------------//

//---------------------------Form Verify-----------------------------------//






  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ScreenBackground(
            child: SingleChildScrollView(
      child: Padding(
        key: _formKey,
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

              ),
              const SizedBox(height: 10),
              TextFormField(
                textInputAction: TextInputAction.next,
                controller: _firstNamelTEController,
                decoration: const InputDecoration(
                  hintText: "First Name",
                ),
              ),
              const SizedBox(height: 10),
              TextFormField(
                textInputAction: TextInputAction.next,
                controller: _lastNameTEController,
                decoration: const InputDecoration(
                  hintText: "Last Name",
                ),
              ),
              const SizedBox(height: 10),
              TextFormField(
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.phone,
                controller: _mobileTEController,
                decoration: const InputDecoration(
                  hintText: "Mobile Number",
                ),
              ),
              const SizedBox(height: 10),
              TextFormField(
                textInputAction: TextInputAction.next,
                controller: _passwordTEController,
                decoration: const InputDecoration(
                  hintText: "Possword",
                ),
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

  void _onTapSignInButton() {
    Navigator.pop(context);
  }
  void _onTapSubmitButton () {

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
