import 'dart:io';
import 'package:flutter/material.dart';
import 'file_encode_controller.dart';

class FileEncodeView extends StatefulWidget {
  const FileEncodeView({super.key});

  static const String routeName = '/file_picker';

  @override
  State<FileEncodeView> createState() => _FileEncodeViewState();
}

class _FileEncodeViewState extends State<FileEncodeView> {
  final FileEncodeController controller = FileEncodeController();

  File? _selectedFile;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
              onPressed: () async {
                final file = await controller.pickFile();
                if (file != null) {
                  setState(() {
                    _selectedFile = file;
                  });
                }
              },
              color: Colors.blueAccent,
              child: const Text(
                'Pick file',
                style: TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(height: 20),
            if (_selectedFile != null)
              Text(
                'Picked file: ${_selectedFile!.path}',
                style: const TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
