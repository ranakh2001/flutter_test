import 'package:doos_doos/utils/shared/shared_pref_settings.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';


final sharedPrefsProvider = Provider<SharedPreferences>((ref) {
  throw UnimplementedError();
});

// shared preference settings Provider
final sharedPrefSettings = Provider<SharedPrefSettings>((ref) {
  final prefs = ref.watch(sharedPrefsProvider);
  return SharedPrefSettings(prefs);
});