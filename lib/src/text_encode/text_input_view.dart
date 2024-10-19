import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:share_plus/share_plus.dart';
import 'package:easy_localization/easy_localization.dart';

import '../ciphers/encode_helper.dart';
import '../ciphers/morse_encoder.dart';
import '../ciphers/caesar_encoder.dart';
import '../ciphers/vigenere_encoder.dart';

enum EncodeAlgorithm { morse, caesar, vigenere }

class TextInputView extends StatefulWidget {
  const TextInputView({super.key});

  @override
  State<TextInputView> createState() => _TextInputView();
}

class _TextInputView extends State<TextInputView> {
  final TextEditingController _keyController = TextEditingController();
  final TextEditingController _inputController = TextEditingController();
  final TextEditingController _outputController = TextEditingController();

  EncodeAlgorithm _selectedAlgorithm = EncodeAlgorithm.morse;

  int _shiftValue = 1;
  Locale? _previousLocale;

  bool _isErrorMessageVisible = false;

  // To avoid slider overflow on locale changing due to different max alphabets sizes
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final currentLocale = context.locale;
    if (_previousLocale != currentLocale) {
      // Locale has changed, reset the slider value
      setState(() {
        _shiftValue = 1;
      });
      _previousLocale = currentLocale;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Dropdown for algorithm selection
                    DropdownButton<EncodeAlgorithm>(
                      value: _selectedAlgorithm,
                      onChanged: (EncodeAlgorithm? newValue) {
                        setState(() {
                          _selectedAlgorithm =
                              newValue ?? EncodeAlgorithm.morse;
                          _inputController.clear();
                          _outputController.clear();
                          _keyController.clear();
                          _shiftValue = 1;
                        });
                      },
                      items: EncodeAlgorithm.values
                          .map<DropdownMenuItem<EncodeAlgorithm>>(
                              (EncodeAlgorithm value) {
                        return DropdownMenuItem<EncodeAlgorithm>(
                          value: value,
                          child: Text(
                              context.tr(value.toString().split('.').last)),
                        );
                      }).toList(),
                      isExpanded: true,
                    ),
                    SizedBox(height: 20),

                    // Key input field (shown only for Vigenere)
                    if (_selectedAlgorithm == EncodeAlgorithm.vigenere)
                      TextField(
                        controller: _keyController,
                        decoration: InputDecoration(
                          labelText: context.tr('vigenereKeyHint'),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20)),
                        ),
                        textCapitalization: TextCapitalization.characters,
                        keyboardType: TextInputType.text,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.allow(RegExp(
                              EncodeHelper.alphabetInfo(context.locale.languageCode)['capitalLettersRange']!)),
                        ],
                        onChanged: (text) {
                          setState(() {
                            _keyController.text = text;
                          });
                        },
                      ),

                    // Caesar slider
                    if (_selectedAlgorithm == EncodeAlgorithm.caesar)
                      Column(children: [
                        Text(context.tr('caesarShiftHint')),
                        Slider(
                          value: _shiftValue.toDouble(),
                          min: 1,
                          max: double.parse(EncodeHelper.alphabetInfo( context.locale.languageCode)['sizeOfAlphabet']!),
                          divisions: int.parse(EncodeHelper.alphabetInfo(context .locale.languageCode)['sizeOfAlphabet']!) - 1,
                          label: _shiftValue.toString(),
                          activeColor: Colors.blue,
                          onChanged: (double value) {
                            setState(() {
                              _shiftValue = value.toInt();
                            });
                          },
                        ),
                      ]),
                    SizedBox(height: 20),

                    // Input text field
                    TextField(
                      controller: _inputController,
                      maxLines: null,
                      enabled: _keyController.text.isNotEmpty ||
                          [EncodeAlgorithm.morse, EncodeAlgorithm.caesar]
                              .contains(_selectedAlgorithm),
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20)),
                          hintText: context.tr('encoderInputHint')),
                      onChanged: (text) {
                        setState(() {
                          try {
                            switch (_selectedAlgorithm) {
                              case EncodeAlgorithm.morse:
                                _outputController.text = MorseEncoder.encode(
                                    _inputController.text,
                                    context.locale.languageCode);
                              case EncodeAlgorithm.caesar:
                                _outputController.text = CaesarEncoder.encode(
                                    _inputController.text,
                                    _shiftValue,
                                    context.locale.languageCode);
                              case EncodeAlgorithm.vigenere:
                                _outputController.text = VigenereEncoder.encode(
                                    _inputController.text,
                                    _keyController.text,
                                    context.locale.languageCode);
                            }
                          } on FormatException catch (e) {
                            if (_isErrorMessageVisible == false) {
                              _isErrorMessageVisible = true;

                              ScaffoldMessenger.of(context)
                                  .showSnackBar(
                                    SnackBar(
                                      content: Text(e.message),
                                      backgroundColor: Colors.red,
                                      showCloseIcon: true,
                                      behavior: SnackBarBehavior.floating,
                                    ),
                                  )
                                  .closed
                                  .then((_) {
                                setState(() {
                                  _isErrorMessageVisible =
                                      false; // To get rid of messages in the queue
                                });
                              });
                            }
                          }
                        });
                      },
                    ),
                    SizedBox(height: 20),

                    // Output text field
                    TextField(
                        controller: _outputController,
                        maxLines: null,
                        readOnly: true,
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.blue,
                            border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(20)),
                            hintStyle: TextStyle(color: Colors.white),
                            hintText: context.tr('encoderOutputHint'))),
                    SizedBox(height: 10),

                    // Row with Copy and Share buttons
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                          icon: Icon(Icons.copy),
                          onPressed: () {
                            Clipboard.setData(
                              ClipboardData(text: _outputController.text),
                            );
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                  content: Text(context.tr('copiedMessage'))),
                            );
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.share),
                          onPressed: () {
                            if (_outputController.text.isNotEmpty) {
                              Share.share(_outputController.text);
                            }
                          },
                        ),
                      ],
                    ),
                  ],
                ))));
  }
}
