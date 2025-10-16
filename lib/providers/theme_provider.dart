import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.system;
  ColorScheme _colorScheme = ColorScheme.fromSeed(seedColor: Colors.blue);

  ThemeMode get themeMode => _themeMode;
  ColorScheme get colorScheme => _colorScheme;

  ThemeProvider() {
    _loadThemeMode();
  }

  ThemeData get lightTheme => ThemeData(
        useMaterial3: true,
        colorScheme: _colorScheme.copyWith(brightness: Brightness.light),
        appBarTheme: const AppBarTheme(centerTitle: true),
      );

  ThemeData get darkTheme => ThemeData(
        useMaterial3: true,
        colorScheme: _colorScheme.copyWith(brightness: Brightness.dark),
        appBarTheme: const AppBarTheme(centerTitle: true),
      );

  void setThemeMode(ThemeMode mode) async {
    _themeMode = mode;
    notifyListeners();
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('themeMode', mode.index);
  }

  void setColorScheme(Color seedColor) {
    _colorScheme = ColorScheme.fromSeed(seedColor: seedColor);
    notifyListeners();
  }

  Future<void> _loadThemeMode() async {
    final prefs = await SharedPreferences.getInstance();
    final themeModeIndex = prefs.getInt('themeMode') ?? 0;
    _themeMode = ThemeMode.values[themeModeIndex];
    notifyListeners();
  }

  // Predefined color schemes for charging screen saver
  static final List<Color> colorSchemes = [
    Colors.blue,
    Colors.green,
    Colors.purple,
    Colors.orange,
    Colors.teal,
    Colors.pink,
    Colors.indigo,
    Colors.red,
  ];
}
