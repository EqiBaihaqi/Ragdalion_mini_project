import 'package:shared_preferences/shared_preferences.dart';

class StorageDevice {
  static const token = 'token';

  Future<void> saveToken() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(token, '123');
  }

  Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    String? savedToken = prefs.getString(token);
    return savedToken;
  }

  Future<void> clearToken() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }
}
