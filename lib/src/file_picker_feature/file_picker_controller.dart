import 'package:file_picker/file_picker.dart';

class FilePickerController {
  Future<void> pickFile() async {

    final result = await FilePicker.platform.pickFiles(
      allowMultiple: false,
      type: FileType.custom,
      allowedExtensions: ['jpg', 'png', 'jpeg', 'mp4', 'avi', 'mov'],
    );

    if (result == null) return;
  }
}
