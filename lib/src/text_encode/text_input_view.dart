import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:share_plus/share_plus.dart';

import '../ciphers/morse_encoder.dart';

class TextInputView extends StatefulWidget {
  const TextInputView({super.key});

  @override
  State<TextInputView> createState() => _TextInputView();
}

class _TextInputView extends State<TextInputView> {
  String _selectedAlgorithm = "Morse";
  final TextEditingController _keyController = TextEditingController();
  final TextEditingController _inputController = TextEditingController();
  final TextEditingController _outputController = TextEditingController();

  final List<String> _algorithms = ["Morse", "Caesar", "Vigenère"];
  bool _isKeyProvided = false;

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
            DropdownButton<String>(
              value: _selectedAlgorithm,
              onChanged: (String? newValue) {
                setState(() {
                  _selectedAlgorithm = newValue ?? _algorithms.first;
                  _inputController.clear();
                  _outputController.clear();
                  _keyController.clear();
                  _isKeyProvided = false;
                });
              },
              items: _algorithms.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              isExpanded: true,
            ),
            SizedBox(height: 20),

            // Key input field (shown only for Vigenère and Caesar)
            if (["Vigenère", "Caesar"].contains(_selectedAlgorithm))
              TextField(
                controller: _keyController,
                decoration: InputDecoration(
                  labelText: "Key or shift:",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20)
                  ),
                ),
                keyboardType:
                _selectedAlgorithm == "Caesar"
                ? TextInputType.number
                : TextInputType.text,
                inputFormatters: <TextInputFormatter>[
                  _selectedAlgorithm == "Caesar"
                  ? FilteringTextInputFormatter.digitsOnly
                  : FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z]')) // Update for different languages
                ],
                onChanged: (text) {
                  setState(() {
                    _isKeyProvided = text.isNotEmpty;
                  });
                },
              ),
              SizedBox(height: 20),

              // Input text field
              TextField(
                controller: _inputController,
                maxLines: null,
                enabled: _isKeyProvided || _selectedAlgorithm == "Morse",
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20)
                  ),
                  hintText: "Enter text here..."
                ),
                onChanged: (text) {
                  setState(() {
                    _outputController.text = MorseEncoder.convertToMorseCode(_inputController.text);
                  });
                },
              ),
              SizedBox(height: 20),

              TextField(
                controller: _outputController,
                maxLines: null,
                readOnly: true,
                style: TextStyle(
                  color: Colors.white
                ),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.blue,
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(20)
                  ),
                  hintStyle: TextStyle(color: Colors.white),
                  hintText: "...and watch the magic happen"
                ),
              ),
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
                        SnackBar(content: Text('Copied to clipboard')),
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
          )
        )
      )
    );
  }
}
