import 'package:shared_preferences/shared_preferences.dart';

class StorageService {
  static const keyName = "user_name";
  static const keyAge = "user_age";
  static const keyEmail = "user_email";
  static const keyTimestamp = "last_saved";

  static Future<void> saveUser({
    required String name,
    required int age,
    required String email,
  }) async {
    final p = await SharedPreferences.getInstance();
    await p.setString(keyName, name);
    await p.setInt(keyAge, age);
    await p.setString(keyEmail, email);
    await p.setString(keyTimestamp, DateTime.now().toIso8601String());
  }

  static Future<Map<String, dynamic>> loadUser() async {
    final p = await SharedPreferences.getInstance();
    return {
      "name": p.getString(keyName),
      "email": p.getString(keyEmail),
      "age": p.getInt(keyAge),
      "timestamp": p.getString(keyTimestamp),
    };
  }

  static Future<void> clear() async {
    final p = await SharedPreferences.getInstance();
    await p.clear();
  }
}
