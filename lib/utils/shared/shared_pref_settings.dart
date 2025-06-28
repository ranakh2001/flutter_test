import 'package:doos_doos/utils/constants/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefSettings {
  //private shared preferences instance
  final SharedPreferences _prefs;

  SharedPrefSettings(this._prefs);

  // shared preference variables keys
  static const _isFirstTimeKey = 'isFirstTime';
  static const _languageKey = 'languageCode';
  static const _userTokenKey = 'userToken';
  static const _fcmTokenKey = 'fcmToken';
  static const _userIdKey = 'userId';
  static const _isLoggedInKey = 'isLoggedIn';

  //is first time open app
  bool get isFirstTime => _prefs.getBool(_isFirstTimeKey) ?? false;
  Future<void> setFirstTime() => _prefs.setBool(_isFirstTimeKey, true);

  // language code
  String get language => _prefs.getString(_languageKey) ?? Constants.enLangCode;
  Future<void> setLanguage(String langCode) =>
      _prefs.setString(_languageKey, langCode);

  // user token
  String? get userToken => _prefs.getString(_userTokenKey);
  Future<void> setUserToken(String token) =>
      _prefs.setString(_userTokenKey, token);

  //fcm token
  String? get fcmToken => _prefs.getString(_fcmTokenKey);
  Future<void> setFcmToken(String token) =>
      _prefs.setString(_fcmTokenKey, token);

  // user id
  String? get userId => _prefs.getString(_userIdKey);
  Future<void> setUserId(String id) => _prefs.setString(_userIdKey, id);

  // is looged in
  bool get isLoggedIn => _prefs.getBool(_isLoggedInKey) ?? false;
  Future<void> setLoggedIn(bool value) => _prefs.setBool(_isLoggedInKey, value);

  // clear all preferences when user logs out
  Future<void> clearAll() => _prefs.clear();
}
