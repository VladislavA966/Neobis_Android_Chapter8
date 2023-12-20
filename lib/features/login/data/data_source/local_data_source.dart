import 'package:shared_preferences/shared_preferences.dart';

class LocalDataSource {
  static const _usernameKey = 'USERNAME_KEY';

  Future<void> saveUsername(String username) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_usernameKey, username);
  }

  Future<String?> getUsername() async {
  final prefs = await SharedPreferences.getInstance();
  final username = prefs.getString(_usernameKey);
  print("Извлеченный username: $username");
  return username;
}

}
