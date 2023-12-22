import 'package:shared_preferences/shared_preferences.dart';

class LocalDataSource {
  static const _usernameKey = 'USERNAME_KEY';
  static const _tokenKey = 'TOKEN_KEY';

  Future<void> saveUsername(String username) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_usernameKey, username);
  }

  Future<String?> getUsername() async {
    final prefs = await SharedPreferences.getInstance();
    final username = prefs.getString(_usernameKey);

    return username;
  }

  Future<void> saveToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_tokenKey, token);
  }

  Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString(_tokenKey);
    return token;
  }
}
