import 'package:flutter/material.dart';

class AppTheme {
  static const primaryColor = Color(0xff1A5CFF);
  static const errorColor = Color(0xffFF645C);

  static const padding12 = EdgeInsets.all(12);
  static const inputPadding = EdgeInsets.symmetric(
    vertical: 12,
    horizontal: 16,
  );

  static BorderRadius borderRadius = BorderRadius.circular(24);
  static OutlineInputBorder _defaultOutlineInputBorder = OutlineInputBorder(
    borderSide: const BorderSide(color: Color(0xff6371DE)),
    borderRadius: borderRadius,
  );

  static const textStyle14 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
  );

  static ThemeData light = ThemeData.light().copyWith(
    colorScheme: const ColorScheme.dark(
      primary: primaryColor,
      onPrimary: Color(0xff262931),
      surface: Color(0xffBFDBFE),
    ),
    scaffoldBackgroundColor: const Color(0xffF9F9F9),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: const Color(0xff1A5CFF),
        shape: RoundedRectangleBorder(
          borderRadius: borderRadius,
        ),
        padding: padding12,
        textStyle: textStyle14,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: borderRadius,
        ),
        padding: padding12,
        textStyle: textStyle14,
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: const Color(0xffF9F9F9),
      hintStyle: const TextStyle(color: Color(0xff262931)),
      contentPadding: inputPadding,
      enabledBorder: _defaultOutlineInputBorder,
      focusedBorder: _defaultOutlineInputBorder,
      errorBorder: _defaultOutlineInputBorder.copyWith(
        borderSide: const BorderSide(color: errorColor),
      ),
      focusedErrorBorder: _defaultOutlineInputBorder.copyWith(
        borderSide: const BorderSide(color: errorColor),
      ),
      border: _defaultOutlineInputBorder,
    ),
  );

  static ThemeData dark = ThemeData.dark().copyWith(
    colorScheme: const ColorScheme.dark(
      primary: primaryColor,
      onPrimary: Color(0xffffffff),
      surface: Color(0xff1E293B),
    ),
    scaffoldBackgroundColor: const Color(0xff181818),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: const Color(0xffffffff),
        shape: RoundedRectangleBorder(
          borderRadius: borderRadius,
        ),
        padding: padding12,
        textStyle: textStyle14,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: borderRadius,
        ),
        padding: padding12,
        textStyle: textStyle14,
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: const Color(0xff181818),
      hintStyle: const TextStyle(color: Color(0xffffffff)),
      contentPadding: inputPadding,
      enabledBorder: _defaultOutlineInputBorder,
      focusedBorder: _defaultOutlineInputBorder,
      errorBorder: _defaultOutlineInputBorder.copyWith(
        borderSide: const BorderSide(color: errorColor),
      ),
      focusedErrorBorder: _defaultOutlineInputBorder.copyWith(
        borderSide: const BorderSide(color: errorColor),
      ),
      border: _defaultOutlineInputBorder,
    ),
  );
}
