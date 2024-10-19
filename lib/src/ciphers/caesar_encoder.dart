import 'package:easy_localization/easy_localization.dart';

import 'encode_helper.dart';

class CaesarEncoder {
  static String encode(String text, int key, String languageCode) {
    Map<String, String> alphabetInfo = EncodeHelper.alphabetInfo(languageCode);

    int firstSmallLetterOfAlphabetCode =
        alphabetInfo['firstSmallLetterOfAlphabet']!.codeUnitAt(0);
    int lastSmallLetterOfAlphabetCode =
        alphabetInfo['lastSmallLetterOfAlphabet']!.codeUnitAt(0);
    int firstBigLetterOfAlphabetCode =
        alphabetInfo['firstBigLetterOfAlphabet']!.codeUnitAt(0);
    int lastBigLetterOfAlphabetCode =
        alphabetInfo['lastBigLetterOfAlphabet']!.codeUnitAt(0);
    int sizeOfAlpabet = int.parse(alphabetInfo['sizeOfAlphabet']!);

    String result = "";

    for (var i = 0; i < text.length; i++) {
      if (EncodeHelper.specialCharacters.contains(text[i])) {
        result += text[i];
        continue;
      }

      int ch = text.codeUnitAt(i), x;
      int offset = 0;

      if (ch >= firstSmallLetterOfAlphabetCode &&
          ch <= lastSmallLetterOfAlphabetCode) {
        offset = firstSmallLetterOfAlphabetCode;
      } else if (ch >= firstBigLetterOfAlphabetCode &&
          ch <= lastBigLetterOfAlphabetCode) {
        offset = firstBigLetterOfAlphabetCode;
      } else {
        throw FormatException(
            tr('invalidSymbolMessage', namedArgs: {'symbol': text[i]}));
      }

      x = (ch + key - offset) % sizeOfAlpabet;
      result += String.fromCharCode(x + offset);
    }
    return result;
  }
}
