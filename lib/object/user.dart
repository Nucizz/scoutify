import 'package:encrypt/encrypt.dart';

class User {
  String username;
  String emailAddress;
  String hashedToken;

  String? imagePath;

  User(
      {required this.username,
      required this.emailAddress,
      required this.hashedToken,
      this.imagePath});

  static String encoder(String data) {
    final key = Key.fromSecureRandom(32);
    final iv = IV.fromLength(16);
    final encrypter = Encrypter(AES(key));

    return encrypter.encrypt(data, iv: iv).base64;
  }
}
