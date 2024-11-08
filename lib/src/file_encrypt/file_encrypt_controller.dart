import 'dart:typed_data';
import 'dart:io';
import 'dart:math';
import 'package:encrypt/encrypt.dart';
import 'package:crypto/crypto.dart';
import 'dart:convert';
import 'package:pointycastle/asymmetric/api.dart';

enum EncryptionMode { AES, RSA }

class FileEncryptController {
  Uint8List aesEncrypt(Uint8List fileBytes, String secretKey) {
    final key = Key(sha256.convert(utf8.encode(secretKey)).bytes as Uint8List);
    final iv = IV.fromLength(16);

    final encrypter = Encrypter(AES(key, mode: AESMode.cbc));
    final encrypted = encrypter.encryptBytes(fileBytes, iv: iv);

    return Uint8List.fromList(iv.bytes + encrypted.bytes);
  }

  Uint8List aesDecrypt(Uint8List encryptedBytes, String secretKey) {
    final Map<String, Uint8List> parsedEncryptedData =
        _parseEncryptedData(encryptedBytes, EncryptionMode.AES);

    final key = Key(sha256.convert(utf8.encode(secretKey)).bytes as Uint8List);
    final iv = IV(parsedEncryptedData['iv']!);

    final encrypter = Encrypter(AES(key, mode: AESMode.cbc));
    final decrypted = encrypter.decryptBytes(
        Encrypted(parsedEncryptedData['encryptedMediaBytes']!),
        iv: iv);

    return Uint8List.fromList(decrypted);
  }

  Future<Uint8List> rsaEncrypt(Uint8List fileBytes, File publicKeyFile) async {
    final key = await publicKeyFile.readAsString();
    final parser = RSAKeyParser();
    final publicKey = parser.parse(key) as RSAPublicKey;

    final sessionKeyBytes =
        List<int>.generate(32, (i) => Random.secure().nextInt(256));
    final sessionKey = base64.encode(sessionKeyBytes);

    final encryptedFileBytes = aesEncrypt(fileBytes, sessionKey);

    final sessionKeyEncrypter = Encrypter(RSA(publicKey: publicKey));
    final sessionKeyEncrypted =
        sessionKeyEncrypter.encryptBytes(sessionKeyBytes);

    return Uint8List.fromList(sessionKeyEncrypted.bytes + encryptedFileBytes);
  }

  Future<Uint8List> rsaDecrypt(
      Uint8List encryptedBytes, File privateKeyFile) async {
    final key = await privateKeyFile.readAsString();
    final parser = RSAKeyParser();
    final privateKey = parser.parse(key) as RSAPrivateKey;

    final Map<String, Uint8List> parsedEncryptedData = _parseEncryptedData(
        encryptedBytes, EncryptionMode.RSA, privateKey.modulus);

    final sessionKeyEncryptedBytes =
        parsedEncryptedData['sessionKeyEncryptedBytes'];
    final sessionKeyEncrypter = Encrypter(RSA(privateKey: privateKey));
    final sessionKeyBytes =
        sessionKeyEncrypter.decryptBytes(Encrypted(sessionKeyEncryptedBytes!));
    final sessionKey = base64.encode(sessionKeyBytes);

    final decrypted =
        aesDecrypt(parsedEncryptedData['encryptedMediaBytes']!, sessionKey);

    return Uint8List.fromList(decrypted);
  }

  Map<String, Uint8List> _parseEncryptedData(
      Uint8List encryptedBytes, EncryptionMode mode,
      [BigInt? keyModulus]) {
    switch (mode) {
      case EncryptionMode.AES:
        return {
          'iv': encryptedBytes.sublist(0, 16),
          'encryptedMediaBytes': encryptedBytes.sublist(16),
        };
      case EncryptionMode.RSA:
        final bytesModulusLength = (keyModulus!.bitLength + 7) ~/ 8;

        return {
          'sessionKeyEncryptedBytes':
              encryptedBytes.sublist(0, bytesModulusLength),
          'encryptedMediaBytes': encryptedBytes.sublist(bytesModulusLength),
        };
    }
  }
}
