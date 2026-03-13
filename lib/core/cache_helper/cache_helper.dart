import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

@module
abstract class RegisterModule {
  @preResolve
  Future<SharedPreferences> get prefs async =>
      await SharedPreferences.getInstance();
}

@lazySingleton
class LocalStorageService {
  final SharedPreferences _prefs;

  LocalStorageService(this._prefs);

  Future<bool> save<T>(String key, T value) async {
    if (value is String) {
      return _prefs.setString(key, value);
    }

    if (value is int) {
      return _prefs.setInt(key, value);
    }

    if (value is double) {
      return _prefs.setDouble(key, value);
    }

    if (value is bool) {
      return _prefs.setBool(key, value);
    }

    if (value is List<String>) {
      return _prefs.setStringList(key, value);
    }

    /// fallback for objects
    return _prefs.setString(key, jsonEncode(value));
  }

  T? get<T>(String key) {
    final value = _prefs.get(key);

    if (value == null) return null;

    if (T == String) return value as T;
    if (T == int) return value as T;
    if (T == double) return value as T;
    if (T == bool) return value as T;
    if (T == List<String>) return value as T;

    /// decode json
    return jsonDecode(value as String) as T;
  }

  Future<bool> remove(String key) {
    return _prefs.remove(key);
  }

  Future<bool> clear() {
    return _prefs.clear();
  }

  bool containsKey(String key) {
    return _prefs.containsKey(key);
  }
}
