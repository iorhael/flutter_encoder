import 'package:flutter/material.dart';

import '../settings/settings_view.dart';

class FilePickerView extends StatelessWidget {
  const FilePickerView ({super.key});

  static const routeName = '/';

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
        child: MaterialButton(
          onPressed: () {},
          color: Colors.green,
          child: const Text(
            'Pick and open file',
            style: TextStyle(color: Colors.white),
          ),
        )
      ),
    );
  }
}
