import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_aban_interview/core/common/constants/shared_preferences_keys.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@singleton
class ThemeManagementCubit extends Cubit<ThemeMode> {
  final SharedPreferences _prefs;

  ThemeManagementCubit(this._prefs) : super(_loadThemeMode(_prefs));

  static ThemeMode _loadThemeMode(SharedPreferences prefs) {
    final value = prefs.getString(themeModeKey);
    switch (value) {
      case 'dark':
        return ThemeMode.dark;
      case 'light':
        return ThemeMode.light;
      default:
        return ThemeMode.system;
    }
  }

  void toggleTheme() {
    final brightness = WidgetsBinding.instance.platformDispatcher.platformBrightness;
    final isCurrentlyDark = state == ThemeMode.system
        ? brightness == Brightness.dark
        : state == ThemeMode.dark;

    if (isCurrentlyDark) {
      _prefs.setString(themeModeKey, ThemeMode.light.name);
      emit(ThemeMode.light);
    } else {
      _prefs.setString(themeModeKey, ThemeMode.dark.name);
      emit(ThemeMode.dark);
    }

    // _prefs.remove(themeModeKey);
  }
}
