import 'package:flutter/material.dart';
import 'package:task_management/ui/widgets/screen_background.dart';
import 'package:task_management/ui/widgets/tm_app_bar.dart';

class UpdateProfileScreen extends StatefulWidget {
  const UpdateProfileScreen({super.key});

  @override
  State<UpdateProfileScreen> createState() => _UpdateProfileScreenState();
}

class _UpdateProfileScreenState extends State<UpdateProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TMAppBar(
        fromProfileScreen: true,
      ),
      body: ScreenBackground(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const SizedBox(height: 32),
              Text(
                "Update Your Profile...",
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 24),
              _buildPhotoPickerWidget(),
              const SizedBox(height: 10),
              TextFormField(
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(hintText: 'Email'),
              ),
              const SizedBox(height: 10),
              TextFormField(
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(hintText: 'First Name'),
              ),
              const SizedBox(height: 10),
              TextFormField(
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(hintText: 'Last Name'),
              ),
              const SizedBox(height: 10),
              TextFormField(
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(hintText: 'Mobile'),
              ),
              const SizedBox(height: 10),
              TextFormField(
                keyboardType: TextInputType.visiblePassword,
                decoration: InputDecoration(hintText: 'Password'),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                  onPressed: _onTapSubmitButton,
                  child: Icon(Icons.arrow_circle_right_outlined)),
            ]),
          ),
        ),
      ),
    );
  }

  void _onTapSubmitButton() {}

  Widget _buildPhotoPickerWidget() {
    return GestureDetector(
      onTap: _onTapPhotoPicker,
      child: Container(
        height: 50,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(8)),
        child: Row(children: [
          Container(
              height: 50,
              width: 80,
              decoration: BoxDecoration(
                  color: Color(0xFF0E104B),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8),
                    bottomLeft: Radius.circular(8),
                  )),
              alignment: Alignment.center,
              child: Text(
                'Photo',
                style: TextStyle(color: Colors.white),
              )),
          const SizedBox(width: 8),
          const Text('Select your Photo')
        ]),
      ),
    );
  }

  void _onTapPhotoPicker() {}
}
