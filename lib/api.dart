import 'package:dio/dio.dart';
import 'package:nepali_connect/flutter_secure_storage.dart';

final dio = Dio();
// const String baseUrl = "http://localhost:8080";
// const String baseUrl = "http://192.168.10.90:8080";
const String baseUrl = "http://192.168.10.76:8080";
const String loginUrl = "$baseUrl/api/auth/login";
const String registerUrl = "$baseUrl/api/auth/register";
const String logoutUrl = "$baseUrl/api/auth/logout";
const String userUrl = "$baseUrl/api/v1/user";
void addHeader() async {
  dio.options.headers["authorization"] = await storage.read(key: "jwt");
}
