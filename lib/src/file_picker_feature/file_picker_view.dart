import 'package:flutter/material.dart';
import '../settings/settings_view.dart';
import 'file_picker_controller.dart';

class FilePickerView extends StatelessWidget {
  const FilePickerView ({super.key, required this.controller});

  static const routeName = '/';

  final FilePickerController controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcome to encoder'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              Navigator.restorablePushNamed(context, SettingsView.routeName);
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
              onPressed: () {
                controller.pickFile();
              },
              color: Colors.blueAccent,
              child: const Text(
                'Pick file',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
