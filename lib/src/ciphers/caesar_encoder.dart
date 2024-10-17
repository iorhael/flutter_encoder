import 'encode_helper.dart';

class CaesarEncoder {
  static String encode(String text, int key) {
    String result = "";

    for (var i = 0; i < text.length; i++) {
      if (EncodeHelper.specialCharacters.contains(text[i])){
        result += text[i];
        continue;
      }

      int ch = text.codeUnitAt(i), x;
      int offset = 0;

      if (ch >= 'a'.codeUnitAt(0) && ch <= 'z'.codeUnitAt(0)){
        offset = 97;
      }
      else if (ch >= 'A'.codeUnitAt(0) && ch <= 'Z'.codeUnitAt(0)){
        offset = 65;
      }else{
        throw FormatException("Invalid symbol: ${text[i]}");
      }

      x = (ch + key - offset) % 26;
      result += String.fromCharCode(x + offset);
    }
    return result;
  }
}
