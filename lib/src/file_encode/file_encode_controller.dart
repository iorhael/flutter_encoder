import 'package:file_picker/file_picker.dart';
import 'dart:io';

class FileEncodeController {
  Future<File?> pickFile() async {

    final result = await FilePicker.platform.pickFiles(
      allowMultiple: false,
      type: FileType.custom,
      allowedExtensions: ['jpg', 'png', 'jpeg', 'mp4', 'avi', 'mov'],
    );

    if (result == null) return null;

    return File(result.files.single.path!);
  }
}
