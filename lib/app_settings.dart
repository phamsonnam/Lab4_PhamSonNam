import 'package:flutter/material.dart';

/// Trạng thái app dùng chung (theme) – [GoRouter] lắng nghe qua [Listenable].
class AppSettings extends ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.light;

  ThemeMode get themeMode => _themeMode;

  void setThemeMode(ThemeMode mode) {
    if (_themeMode == mode) return;
    _themeMode = mode;
    notifyListeners();
  }
}
