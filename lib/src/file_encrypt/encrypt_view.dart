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

Uint8List encryptAESInIsolate(Map<String, dynamic> args) {
  final Uint8List bytes = args['bytes'];
  final String key = args['key'];
  final FileEncryptController controller = args['controller'];

  return controller.aesEncrypt(bytes, key);
}

Future<Uint8List> encryptRSAInIsolate(Map<String, dynamic> args) async {
  final Uint8List bytes = args['bytes'];
  final File publicKeyFile = args['publicKeyFile'];
  final FileEncryptController controller = args['controller'];

  return controller.rsaEncrypt(bytes, publicKeyFile);
}

class EncryptView extends StatefulWidget {
  const EncryptView({super.key});

  @override
  State<EncryptView> createState() => _EncryptViewState();
}

class _EncryptViewState extends State<EncryptView> {
  bool _isAES = true;

  final TextEditingController _aesKeyController = TextEditingController();
  final FilePickerController _pickerController = FilePickerController();
  final FileEncryptController _encryptController = FileEncryptController();

  File? _publicKeyFile;
  File? _fileToEncrypt;

  void _toggleAlgorithm() {
    setState(() {
      _isAES = !_isAES;
      _aesKeyController.clear();
      _publicKeyFile = null;
      _fileToEncrypt = null;
    });
  }

  Future<void> _encryptFile() async {
    final encryptingState = context.read<EncryptingState>();

    encryptingState.startProcess();

    try {
      final Uint8List bytes =
          await _pickerController.fileBytes(_fileToEncrypt!);
      final Uint8List encrypted;

      if (_isAES) {
        encrypted = await compute(encryptAESInIsolate, {
          'bytes': bytes,
          'key': _aesKeyController.text,
          'controller': _encryptController
        });
      } else {
        encrypted = await compute(encryptRSAInIsolate, {
          'bytes': bytes,
          'publicKeyFile': _publicKeyFile,
          'controller': _encryptController
        });
      }

      if (mounted)
        ShareBottomSheet.showFileShareBottomSheet(context, encrypted);
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context)
            .showSnackBar(
              SnackBar(
                content: Text(tr('invalidKeyMessage')),
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
                    child: Text(
                      _isAES ? 'AES' : 'RSA',
                    ),
                  ),
                  SizedBox(height: 24),

                  // AES-specific fields
                  if (_isAES) ...[
                    TextField(
                      controller: _aesKeyController,
                      decoration: InputDecoration(
                        labelText: tr('enterSecretKeyLabel'),
                      ),
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
                            await _pickerController.pickFile(FileTypes.media);
                        setState(() {
                          _fileToEncrypt = file;
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        side: BorderSide(color: Colors.black),
                        padding: const EdgeInsets.symmetric(vertical: 16),
                      ),
                      child: Text(
                        tr('selectFileToEncrypt'),
                      ),
                    ),
                    SizedBox(height: 24),
                    ElevatedButton(
                      onPressed: _aesKeyController.text.isEmpty ||
                              _fileToEncrypt == null
                          ? null
                          : _encryptFile,
                      child: Text(
                        tr('encryptButton'),
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
                          _publicKeyFile = file;
                        });
                      },
                      child: Text(
                        tr('selectPublicKeyFile'),
                      ),
                    ),
                    SizedBox(height: 24),
                    ElevatedButton(
                      onPressed: () async {
                        final file =
                            await _pickerController.pickFile(FileTypes.media);
                        setState(() {
                          _fileToEncrypt = file;
                        });
                      },
                      child: Text(
                        tr('selectFileToEncrypt'),
                      ),
                    ),
                    SizedBox(height: 24),
                    ElevatedButton(
                      onPressed:
                          _publicKeyFile == null || _fileToEncrypt == null
                              ? null
                              : _encryptFile,
                      child: Text(
                        tr('encryptButton'),
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
