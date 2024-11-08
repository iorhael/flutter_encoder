import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../ciphers/encode_helper.dart';
class VigenereKeyInput extends StatefulWidget {
  final TextEditingController keyController;

  const VigenereKeyInput({
    super.key,
    required this.keyController,
  });

  @override
  State<VigenereKeyInput> createState() => _VigenereKeyInput();
}

class _VigenereKeyInput extends State<VigenereKeyInput> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.keyController,
      decoration: InputDecoration(
        labelText: context.tr('vigenereKeyHint'),
      ),
      textCapitalization: TextCapitalization.characters,
      keyboardType: TextInputType.text,
      inputFormatters: <TextInputFormatter>[
        FilteringTextInputFormatter.allow(
          RegExp(
            EncodeHelper.alphabetInfo(context.locale.languageCode)['capitalLettersPattern']!,
          ),
        ),
      ],
    );
  }
}
