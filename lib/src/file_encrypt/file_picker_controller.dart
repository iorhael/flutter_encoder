import 'package:file_picker/file_picker.dart';
import 'dart:io';
import 'dart:typed_data';

class FilePickerController {
  Future<File?> pickFile(List<String> allowedTypes) async {
    final result = await FilePicker.platform.pickFiles(
      allowMultiple: false,
      type: FileType.custom,
      allowedExtensions: allowedTypes,
    );

    if (result == null) return null;

    return File(result.files.single.path!);
  }

  Future<Uint8List> fileBytes(File file) async {
    return await file.readAsBytes();
  }
}
