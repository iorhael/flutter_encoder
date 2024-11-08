import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

import 'encrypt_view.dart';
import 'decrypt_view.dart';

class FileEncryptingView extends StatefulWidget {
  const FileEncryptingView({super.key});

  @override
  State<FileEncryptingView> createState() => _FileEncryptingViewState();
}

class _FileEncryptingViewState extends State<FileEncryptingView> {
  bool _isEncrypt = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 20),
        LayoutBuilder(
          builder: (context, constraints) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ToggleButtons(
                  isSelected: [_isEncrypt, !_isEncrypt],
                  onPressed: (int index) {
                    setState(() {
                      _isEncrypt = index == 0;
                    });
                  },
                  constraints: BoxConstraints(
                    minWidth: constraints.maxWidth * 0.45,
                    minHeight: 50,
                  ),
                  children: [
                    Text(context.tr('encryptToggleButton'),
                        textAlign: TextAlign.center),
                    Text(context.tr('decryptToggleButton'),
                        textAlign: TextAlign.center),
                  ],
                ),
              ],
            );
          },
        ),
        Expanded(
          child: _isEncrypt ? EncryptView() : DecryptView(),
        ),
      ],
    );
  }
}
