import 'package:coffers_in/repository/login_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginService {
  Future<void> criarContaService(
      String username, String email, String password) async {
    LoginRepository loginRepository = LoginRepository();
    Map<String, String> json = {};
    json["username"] = username;
    json["email"] = email;
    json["password"] = password;

    await loginRepository.cadastrarUser(json);
  }

  Future<void> saveTokenSharedPreference(String session) async {
    var prefs = await SharedPreferences.getInstance();
    prefs.setString("session", session);
  }

  Future<void> saveObjectIdSharedPreference(String token) async {
    var prefs = await SharedPreferences.getInstance();
    prefs.setString("objectId", token);
  }

  Future<void> saveUserNameSharedPreference(String userName) async {
    var prefs = await SharedPreferences.getInstance();
    prefs.setString("username", userName);
  }

  Future<void> saveEmailSharedPreference(String email) async {
    var prefs = await SharedPreferences.getInstance();
    prefs.setString("emailUser", email);
  }

  // validar se esta sessão foi expirada
  Future<bool> isAuth() async {
    var prefs = await SharedPreferences.getInstance();
    var jsonResult = prefs.getString("session");

    if (jsonResult != null) {
      return true;
    }

    return false;
  }

  Future<String> getObjectId() async {
    var prefs = await SharedPreferences.getInstance();
    var objectIdResult = prefs.getString("objectId");

    // if (objectIdResult != null) {
    //   return objectIdResult;
    // }
    return objectIdResult!;
  }

  Future<void> logout() async {
    var prefs = await SharedPreferences.getInstance();
    prefs.remove("session");
    prefs.remove("objectId");
    prefs.remove("username");
    prefs.remove("emailUser");
  }

  Future<String> getSession() async {
    var prefs = await SharedPreferences.getInstance();
    var sessionResult = prefs.getString("session");

    return sessionResult!;
  }

  Future<String> getEmail() async {
    var prefs = await SharedPreferences.getInstance();
    var emailResult = prefs.getString("emailUser");

    return emailResult!;
  }

  Future<String> getUserName() async {
    var prefs = await SharedPreferences.getInstance();
    var userNameResult = prefs.getString("username");

    return userNameResult!;
  }
}
