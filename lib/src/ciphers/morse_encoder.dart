class MorseEncoder {
  static final Map<String, String> morseCodeMap = {
    'A': '.-', 'B': '-...', 'C': '-.-.', 'D': '-..', 'E': '.', 'F': '..-.', 'G': '--.', 'H': '....', 'I': '..', 'J': '.---',
    'K': '-.-', 'L': '.-..', 'M': '--', 'N': '-.', 'O': '---', 'P': '.--.', 'Q': '--.-', 'R': '.-.', 'S': '...', 'T': '-',
    'U': '..-', 'V': '...-', 'W': '.--', 'X': '-..-', 'Y': '-.--', 'Z': '--..',
    '0': '-----', '1': '.----', '2': '..---', '3': '...--', '4': '....-', '5': '.....', '6': '-....', '7': '--...', '8': '---..', '9': '----.',
    '.': '.-.-.-', ',': '--..--', '?': '..--..', "'": '.----.', '!': '-.-.--', '/': '-..-.', '(': '-.--.', ')': '-.--.-', '&': '.-...',
    ':': '---...', ';': '-.-.-.', '=': '-...-', '+': '.-.-.', '-': '-....-', '_': '..--.-', '"': '.-..-.', '\$': '...-..-', '@': '.--.-.',
    ' ': '/'
  };

  static String encode(String text) {

    final List<String> words = text.toUpperCase().split(' ');
    final List<String> morseCodeList = [];

    for (final word in words) {
      final List<String> letters = word.split('');
      final List<String> morseCodeLetters = [];

      for (final letter in letters) {
        if (morseCodeMap.containsKey(letter)) {
          morseCodeLetters.add(morseCodeMap[letter]!);
        }else{
          throw FormatException("Invalid symbol: $letter");
        }
      }

      morseCodeList.add(morseCodeLetters.join(' '));
    }

    return morseCodeList.join(' / ');
  }
}
