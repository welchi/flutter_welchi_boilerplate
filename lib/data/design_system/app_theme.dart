import 'package:flutter/material.dart';

ThemeData buildLightTheme(BuildContext context) {
  return ThemeData.from(
    colorScheme: const ColorScheme.light(),
  );
}

ThemeData buildDarkTheme(BuildContext context) {
  return ThemeData.from(
    colorScheme: const ColorScheme.dark(),
  );
}
