import 'package:coffers_in/model/user_model.dart';

import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class UserRepository {
  final _dio = Dio();

  UserRepository() {
    _dio.options.headers["X-Parse-Application-Id"] =
        dotenv.env["APPLICATION_ID_BACK4APP"];
    _dio.options.headers["X-Parse-REST-API-Key"] =
        dotenv.env["REST_API_KEY_BACK4APP"];
    _dio.options.headers["Content-Type"] =
        dotenv.get("CONTENT_TYPE", fallback: "Content Type incorreto");
    _dio.options.baseUrl =
        dotenv.get("BASE_URL_BACK4APP", fallback: "URL incorreta");
  }

  Future<UserModel> getUser(String objectId) async {
    var response = await _dio.get("users/$objectId");

    return UserModel.fromJson(response.data);
  }

  Future<void> editCartUser(String session, String objectId, List data) async {
    _dio.options.headers["X-Parse-Session-Token"] = session;

    _dio.put("users/$objectId", data: {"cart": data});
  }

  Future<List> getCard(String session) async {
    _dio.options.headers["X-Parse-Session-Token"] = session;

    var response = await _dio.get("users/me");

    return response.data["cart"];
  }
}
