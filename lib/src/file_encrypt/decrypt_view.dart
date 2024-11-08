import 'package:flutter/material.dart';
import 'dart:io';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';

import 'file_picker_controller.dart';
import 'file_encrypt_controller.dart';
import 'file_types.dart';
import 'states/encrypting_state.dart';
import 'components/share_bottom_sheet.dart';

Uint8List decryptAESInIsolate(Map<String, dynamic> args) {
  final Uint8List bytes = args['bytes'];
  final String key = args['key'];
  final FileEncryptController controller = args['controller'];

  return controller.aesDecrypt(bytes, key);
}

Future<Uint8List> decryptRSAInIsolate(Map<String, dynamic> args) async {
  final Uint8List bytes = args['bytes'];
  final File privateKeyFile = args['privateKeyFile'];
  final FileEncryptController controller = args['controller'];

  return controller.rsaDecrypt(bytes, privateKeyFile);
}

class DecryptView extends StatefulWidget {
  const DecryptView({super.key});

  @override
  State<DecryptView> createState() => _DecryptViewState();
}

class _DecryptViewState extends State<DecryptView> {
  bool _isAES = true;

  final TextEditingController _aesKeyController = TextEditingController();
  final FilePickerController _pickerController = FilePickerController();
  final FileEncryptController _encryptController = FileEncryptController();

  File? _privateKeyFile;
  File? _fileToDecrypt;

  void _toggleAlgorithm() {
    setState(() {
      _isAES = !_isAES;
      _aesKeyController.clear();
      _privateKeyFile = null;
      _fileToDecrypt = null;
    });
  }

  Future<void> _decryptFile() async {
    final encryptingState = context.read<EncryptingState>();

    encryptingState.startProcess();

    try {
      final Uint8List bytes =
          await _pickerController.fileBytes(_fileToDecrypt!);
      final Uint8List decrypted;

      if (_isAES) {
        decrypted = await compute(decryptAESInIsolate, {
          'bytes': bytes,
          'key': _aesKeyController.text,
          'controller': _encryptController
        });
      } else {
        decrypted = await compute(decryptRSAInIsolate, {
          'bytes': bytes,
          'privateKeyFile': _privateKeyFile,
          'controller': _encryptController
        });
      }

      if (mounted)
        ShareBottomSheet.showFileShareBottomSheet(context, decrypted);
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context)
            .showSnackBar(
              SnackBar(
                content: Text(tr('invalidKeyMessage')),
                backgroundColor: Colors.red,
                showCloseIcon: true,
                behavior: SnackBarBehavior.floating,
              ),
            )
            .closed;
      }
    } finally {
      encryptingState.stopProcess();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ElevatedButton(
                    onPressed: _toggleAlgorithm,
                    style: ElevatedButton.styleFrom(
                      side: BorderSide(color: Colors.black),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 16),
                    ),
                    child: Text(
                      _isAES ? 'AES' : 'RSA',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  SizedBox(height: 24),

                  // AES-specific fields
                  if (_isAES) ...[
                    TextField(
                      controller: _aesKeyController,
                      decoration: InputDecoration(
                        labelText: tr('enterSecretKeyLabel'),
                        labelStyle: TextStyle(fontSize: 18),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(color: Colors.black),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(color: Colors.black),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      style: TextStyle(fontSize: 16),
                      onChanged: (text) {
                        setState(() {
                          _aesKeyController.text = text;
                        });
                      },
                    ),
                    SizedBox(height: 24),
                    ElevatedButton(
                      onPressed: () async {
                        final file =
                            await _pickerController.pickFile(FileTypes.binary);
                        setState(() {
                          _fileToDecrypt = file;
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        side: BorderSide(color: Colors.black),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 16),
                      ),
                      child: Text(
                        tr('selectFileToDecrypt'),
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                    SizedBox(height: 24),
                    ElevatedButton(
                      onPressed: _aesKeyController.text.isEmpty ||
                              _fileToDecrypt == null
                          ? null
                          : _decryptFile,
                      style: ElevatedButton.styleFrom(
                        side: BorderSide(color: Colors.black),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 16),
                      ),
                      child: Text(
                        tr('decryptButton'),
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ],

                  // RSA-specific fields
                  if (!_isAES) ...[
                    ElevatedButton(
                      onPressed: () async {
                        final file =
                            await _pickerController.pickFile(FileTypes.keys);
                        setState(() {
                          _privateKeyFile = file;
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        side: BorderSide(color: Colors.black),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 16),
                      ),
                      child: Text(
                        tr('selectPrivateKeyFile'),
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                    SizedBox(height: 24),
                    ElevatedButton(
                      onPressed: () async {
                        final file =
                            await _pickerController.pickFile(FileTypes.binary);
                        setState(() {
                          _fileToDecrypt = file;
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        side: BorderSide(color: Colors.black),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 16),
                      ),
                      child: Text(
                        tr('selectFileToDecrypt'),
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                    SizedBox(height: 24),
                    ElevatedButton(
                      onPressed:
                          _privateKeyFile == null || _fileToDecrypt == null
                              ? null
                              : _decryptFile,
                      style: ElevatedButton.styleFrom(
                        side: BorderSide(color: Colors.black),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 16),
                      ),
                      child: Text(
                        tr('decryptButton'),
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
