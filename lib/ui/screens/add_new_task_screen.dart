import 'package:flutter/material.dart';
import 'package:task_management/data/service/network_client.dart';
import 'package:task_management/data/utils/urls.dart';
import 'package:task_management/ui/widgets/screen_background.dart';
import 'package:task_management/ui/widgets/snack_bar_message.dart';
import 'package:task_management/ui/widgets/tm_app_bar.dart';

import '../widgets/centered_circular_progress_bar.dart';

class AddNewTaskScreen extends StatefulWidget {
  const AddNewTaskScreen({super.key});

  @override
  State<AddNewTaskScreen> createState() => _AddNewTaskScreenState();
}

class _AddNewTaskScreenState extends State<AddNewTaskScreen> {
  final TextEditingController _titleEditController = TextEditingController();
  final TextEditingController _descriptionEditController =
      TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _addNewTaskInProgress = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TMAppBar(),
      body: ScreenBackground(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Form(
              key: _formKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 32),
                    Text(
                      "Add Your New Task...",
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(height: 24),
                    TextFormField(
                      controller: _titleEditController,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(hintText: 'Task Title'),
                      validator: (String? value) {
                        if (value?.trim().isEmpty ?? true) {
                          return 'Enter Your Title First';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 8),
                    TextFormField(
                        maxLines: 6,
                        controller: _descriptionEditController,
                        decoration: InputDecoration(
                          hintText: 'Task Description',
                          contentPadding:
                              EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        ),
                        validator: (String? value) {
                          if (value?.trim().isEmpty ?? true) {
                            return 'Enter Your Task Description';
                          }
                          return null;
                        }),
                    const SizedBox(height: 8),
                    Visibility(
                      visible: _addNewTaskInProgress == false,
                      replacement: const CenteredCircularProgressBar(),                     child: ElevatedButton(
                          onPressed: _onTapSubmitButton, child: Text('Add Task')),
                    ),
                  ]),
            ),
          ),
        ),
      ),
    );
  }

  void _onTapSubmitButton() {
    if (_formKey.currentState!.validate()) {
      _addNewTask();
    }
  }

  Future<void> _addNewTask() async {
    _addNewTaskInProgress = true;
    setState(() {});
    Map<String, dynamic> requestBody = {
      "title": _titleEditController.text.trim(),
      "description": _descriptionEditController.text.trim(),
      "status": "New"
    };

    final NetworkResponse response = await NetworkClient.postRequest(
      url: Urls.createTaskeUrl,
      body: requestBody,
    );
    _addNewTaskInProgress = false;
    setState(() {});

    if (response.isSuccess) {
      _clearTextField ();
      showSnackBarMessage(context, 'New Task Added!');
    } else {
      showSnackBarMessage(context, response.errorMessage);
    }
  }

  void _clearTextField() {
    _titleEditController.clear();
    _descriptionEditController.clear();
  }

  @override
  void dispose() {
    _titleEditController.dispose();
    _descriptionEditController.dispose();
    super.dispose();
  }
}
