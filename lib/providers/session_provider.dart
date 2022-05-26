import 'package:shared_preferences/shared_preferences.dart';

class SessionProvider {
  final String key = "api_key";
  SessionProvider({
    key,
  });

  final _shPref = SharedPreferences.getInstance();

  Future<String> apiKey() async {
    return (await _shPref).getString(key) ?? "";
  }

  Future<void> saveApiKey(String value) async {
    (await _shPref).setString(key, value);
  }

  Future<void> clearApiKey() async {
    (await _shPref).remove(key);
  }
}
