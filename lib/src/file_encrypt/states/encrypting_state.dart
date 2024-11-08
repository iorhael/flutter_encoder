import 'package:flutter/material.dart';

class EncryptingState with ChangeNotifier {
  bool _isEncrypting = false;

  bool get isEncrypting => _isEncrypting;

  void startProcess() {
    _isEncrypting = true;
    notifyListeners();
  }

  void stopProcess() {
    _isEncrypting = false;
    notifyListeners();
  }
}
