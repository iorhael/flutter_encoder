class EncodeHelper {
  static const List<String> specialCharacters = [
    "!",
    "\"",
    "#",
    "\$",
    "%",
    "&",
    "'",
    "(",
    ")",
    "*",
    "+",
    ",",
    "-",
    ".",
    "/",
    "\n",
    ":",
    ";",
    "<",
    "=",
    ">",
    "?",
    "@",
    "[",
    "\\",
    "]",
    "^",
    "_",
    "`",
    "{",
    "|",
    "}",
    "~",
    "0",
    "1",
    "2",
    "3",
    "4",
    "5",
    "6",
    "7",
    "8",
    "9",
    " "
  ];

  static const Map<String, String> _morseCodeSpecialCharactersMap = {
    '0': '-----',
    '1': '.----',
    '2': '..---',
    '3': '...--',
    '4': '....-',
    '5': '.....',
    '6': '-....',
    '7': '--...',
    '8': '---..',
    '9': '----.',
    '.': '.-.-.-',
    ',': '--..--',
    '?': '..--..',
    "'": '.----.',
    '!': '-.-.--',
    '/': '-..-.',
    '(': '-.--.',
    ')': '-.--.-',
    '&': '.-...',
    ':': '---...',
    ';': '-.-.-.',
    '=': '-...-',
    '+': '.-.-.',
    '-': '-....-',
    '_': '..--.-',
    '"': '.-..-.',
    '\$': '...-..-',
    '@': '.--.-.',
    ' ': '/',
    "\n": "/",
  };

  static const Map<String, String> _morseCodeEnMap = {
    'A': '.-',
    'B': '-...',
    'C': '-.-.',
    'D': '-..',
    'E': '.',
    'F': '..-.',
    'G': '--.',
    'H': '....',
    'I': '..',
    'J': '.---',
    'K': '-.-',
    'L': '.-..',
    'M': '--',
    'N': '-.',
    'O': '---',
    'P': '.--.',
    'Q': '--.-',
    'R': '.-.',
    'S': '...',
    'T': '-',
    'U': '..-',
    'V': '...-',
    'W': '.--',
    'X': '-..-',
    'Y': '-.--',
    'Z': '--..',
    ..._morseCodeSpecialCharactersMap,
  };

  static const Map<String, String> _morseCodeRuMap = {
    'А': '.-',
    'Б': '-...',
    'В': '.--',
    'Г': '--.',
    'Д': '-..',
    'Е': '.',
    'Ж': '...-',
    'З': '--..',
    'И': '..',
    'Й': '.---',
    'К': '-.-',
    'Л': '.-..',
    'М': '--',
    'Н': '-.',
    'О': '---',
    'П': '.--.',
    'Р': '.-.',
    'С': '...',
    'Т': '-',
    'У': '..-',
    'Ф': '..-.',
    'Х': '....',
    'Ц': '-.-.',
    'Ч': '---.',
    'Ш': '----',
    'Щ': '--.-',
    'Ъ': '--.--',
    'Ы': '-.--',
    'Ь': '-..-',
    'Э': '..-..',
    'Ю': '..--',
    'Я': '.-.-',
    ..._morseCodeSpecialCharactersMap,
  };

  static final Map<String, String> _alphabetInfoEnMap = {
    "sizeOfAlphabet": "26",
    "capitalLettersPattern": "[A-Z]",
    "allowedCharacterPattern": "[a-zA-Z${specialCharacters.join()}]",
    "firstSmallLetterOfAlphabet": "a",
    "lastSmallLetterOfAlphabet": "z",
    "firstBigLetterOfAlphabet": "A",
    "lastBigLetterOfAlphabet": "Z"
  };

  static final Map<String, String> _alphabetInfoRuMap = {
    "sizeOfAlphabet": "32",
    "capitalLettersPattern": "[А-Я]",
    "allowedCharacterPattern": "[а-яА-Я${specialCharacters.join()}]",
    "firstSmallLetterOfAlphabet": "а",
    "lastSmallLetterOfAlphabet": "я",
    "firstBigLetterOfAlphabet": "А",
    "lastBigLetterOfAlphabet": "Я"
  };

  static Map<String, String> morseCode(String languageCode) {
    switch (languageCode) {
      case "en":
        return _morseCodeEnMap;
      case "ru":
        return _morseCodeRuMap;
      default:
        throw UnimplementedError(
            "Language support not fully implemented. Please, add morse mappings for $languageCode language");
    }
  }

  static Map<String, String> alphabetInfo(String languageCode) {
    switch (languageCode) {
      case "en":
        return _alphabetInfoEnMap;
      case "ru":
        return _alphabetInfoRuMap;
      default:
        throw UnimplementedError(
            "Language support not fully implemented. Please, add $languageCode alphabet details for encode algorithms");
    }
  }
}
