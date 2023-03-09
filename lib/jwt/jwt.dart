import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:nepali_connect/flutter_secure_storage.dart';

class Jwt {
  static void checkIfExpired(String a) {
    // JwtDecoder.isExpired(a); //check it and logout user or ask fo new refresh token.
  }
  static Future<String?> getToken() async {
    return await storage.read(key: "jwt");
  }
}
