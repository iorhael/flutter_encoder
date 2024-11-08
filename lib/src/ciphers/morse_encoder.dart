import 'encode_helper.dart';

class MorseEncoder {
  static String encode(String text, String languageCode) {
    final Map<String, String> morseCodeMap =
        EncodeHelper.morseCode(languageCode);
    final List<String> words = text.toUpperCase().split(' ');
    final List<String> morseCodeList = [];

    for (final word in words) {
      final List<String> letters = word.split('');
      final List<String> morseCodeLetters = [];

      for (final letter in letters) {
        if (morseCodeMap.containsKey(letter)) {
          morseCodeLetters.add(morseCodeMap[letter]!);
        } else {
          throw FormatException("Invalid symbol $letter");
        }
      }

      morseCodeList.add(morseCodeLetters.join(' '));
    }

    return morseCodeList.join(' / ');
  }
}
