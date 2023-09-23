import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class LoginRepository {
  final _dio = Dio();

  LoginRepository() {
    _dio.options.headers["X-Parse-Application-Id"] =
        dotenv.env["APPLICATION_ID_BACK4APP"];
    _dio.options.headers["X-Parse-REST-API-Key"] =
        dotenv.env["REST_API_KEY_BACK4APP"];
    _dio.options.headers["Content-Type"] =
        dotenv.get("CONTENT_TYPE", fallback: "Content Type incorreto");
    _dio.options.baseUrl =
        dotenv.get("BASE_URL_BACK4APP", fallback: "URL incorreta");
    _dio.options.headers["X-Parse-Revocable-Session"] = 1;
  }

  Future<void> cadastrarUser(Map<String, String> json) async {
    await _dio.post("users", data: json);
  }

  Future<Response> realizarLogin(String userName, String password) async {
    var response = await _dio.get(
        "https://parseapi.back4app.com/login?username=$userName&password=$password");

    return response;
  }
}
