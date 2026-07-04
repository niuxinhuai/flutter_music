import 'dart:convert';
import 'dart:math';

import 'package:encrypt/encrypt.dart' as encrypt;

class NeteaseWeApi {
  static const String _iv = '0102030405060708';
  static const String _presetKey = '0CoJUm6Qyw8W8jud';
  static const String _base62 =
      'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
  static const String _rsaModulus =
      'e0b509f6259df8642dbc35662901477df22677ec152b5ff68ace615bb7b725152b3ab17a876aea8a5aa76d2e417629ec4ee341f56135fccf695280104e0312ecbda92557c93870114af6c9d05c4f7f0c3685b7a46bee255932575cce10b424d813cfe4875d3e82047b97ddef52741d546b8e289dc6935b3ece0462db0a22b8e7';
  static const String _rsaExponent = '010001';

  static final Random _random = Random.secure();

  static Map<String, String> encryptData(Map<String, dynamic> data) {
    final text = jsonEncode(data);
    final secretKey = _createSecretKey();
    return <String, String>{
      'params': _aesEncrypt(_aesEncrypt(text, _presetKey), secretKey),
      'encSecKey': _rsaEncrypt(secretKey),
    };
  }

  static String _createSecretKey() {
    return List.generate(
      16,
      (_) => _base62[_random.nextInt(_base62.length)],
    ).join();
  }

  static String _aesEncrypt(String text, String key) {
    final encrypter = encrypt.Encrypter(
      encrypt.AES(
        encrypt.Key.fromUtf8(key),
        mode: encrypt.AESMode.cbc,
        padding: 'PKCS7',
      ),
    );
    return encrypter.encrypt(text, iv: encrypt.IV.fromUtf8(_iv)).base64;
  }

  static String _rsaEncrypt(String secretKey) {
    final reversedBytes = utf8.encode(secretKey.split('').reversed.join());
    final value = _bytesToBigInt(reversedBytes);
    final encrypted = value.modPow(
      BigInt.parse(_rsaExponent, radix: 16),
      BigInt.parse(_rsaModulus, radix: 16),
    );
    return encrypted.toRadixString(16).padLeft(256, '0');
  }

  static BigInt _bytesToBigInt(List<int> bytes) {
    var result = BigInt.zero;
    for (final byte in bytes) {
      result = (result << 8) | BigInt.from(byte);
    }
    return result;
  }
}
