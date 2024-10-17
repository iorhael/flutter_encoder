import 'encode_helper.dart';

class VigenereEncoder {
  static String encode(String text, String key){
    String result = '';
    int j = 0;
    for (var i = 0; i < text.length; i++) {
      if (EncodeHelper.specialCharacters.contains(text[i])){
        result += text[i];
        continue;
      }

      int ch = text.codeUnitAt(i);
      int offset = 0;

      if (ch >= 'a'.codeUnitAt(0) && ch <= 'z'.codeUnitAt(0)){
        offset = 97;
      }
      else if (ch >= 'A'.codeUnitAt(0) && ch <= 'Z'.codeUnitAt(0)){
        offset = 65;
      }else{
        throw FormatException("Invalid symbol: ${text[i]}");
      }

      int x = (text.codeUnitAt(i) - offset + key.codeUnitAt(j) - 65) % 26 + offset;
      result += String.fromCharCode(x);
      if (j < key.length - 1){
        j++;
      } else {
        j = 0;
      }
    }
    return result;
  }
}
