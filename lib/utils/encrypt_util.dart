import 'package:encrypt/encrypt.dart' as encry;
import 'package:flutter_music/constants/key.dart';

class EncrypterUtils {
  static final key = encry.Key.fromUtf8(ConstantsKey.encrypterKey);
  static final iv = encry.IV.fromUtf8(ConstantsKey.encrypterIV);
  static final encrypter = encry.Encrypter(encry.AES(key));

  static String encrypt(String encryptStr) =>
      encrypter.encrypt(encryptStr, iv: iv).base64;

  static String decrypt(String str) => encrypter.decrypt64(str, iv: iv);
}
