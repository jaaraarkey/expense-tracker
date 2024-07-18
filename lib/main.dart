import 'package:flutter/material.dart';
import 'widgets/expenses.dart';

var kColorScheme = const ColorScheme(
  brightness: Brightness.light,
  primary: Color.fromARGB(255, 0, 17, 255),
  secondary: Color.fromARGB(255, 225, 56, 255),
  surface: Colors.white,
  error: Color.fromARGB(255, 255, 32, 107),
  onPrimary: Colors.white,
  onSecondary: Colors.black,
  onSurface: Colors.black,
  onError: Colors.white,
);

var kDarkColorScheme = const ColorScheme(
  brightness: Brightness.dark,
  primary: Colors.amberAccent,
  secondary: Color.fromARGB(255, 0, 17, 255),
  surface: Color.fromARGB(255, 7, 1, 20),
  error: Color.fromARGB(255, 255, 32, 107),
  onPrimary: Colors.black,
  onSecondary: Colors.black,
  onSurface: Colors.white,
  onError: Colors.white,
);

void main() {
  runApp(
    MaterialApp(
      darkTheme: ThemeData.dark().copyWith(
        colorScheme: kDarkColorScheme,
        textTheme: ThemeData().textTheme.copyWith(
              titleLarge: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              titleMedium: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              titleSmall: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.normal,
              ),
              bodyLarge: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.normal,
              ),
              bodyMedium: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.normal,
              ),
              bodySmall: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.normal,
              ),
            ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: WidgetStateProperty.all(kDarkColorScheme.primary),
            foregroundColor:
                WidgetStateProperty.all(kDarkColorScheme.onPrimary),
            shape: WidgetStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(3),
              ),
            ),
          ),
        ),
        cardTheme: const CardTheme().copyWith(
            margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
            color: kDarkColorScheme.surface,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(0),
                side: const BorderSide().copyWith(
                    color: const Color.fromARGB(255, 45, 45, 45), width: 0)),
            elevation: 8),
      ),
      theme: ThemeData(
        colorScheme: kColorScheme,
        textTheme: ThemeData().textTheme.copyWith(
              titleLarge: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              titleMedium: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              titleSmall: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              bodyLarge: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.normal,
              ),
              bodyMedium: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.normal,
              ),
              bodySmall: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.normal,
              ),
            ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: WidgetStateProperty.all(kColorScheme.primary),
            foregroundColor: WidgetStateProperty.all(kColorScheme.onPrimary),
            shape: WidgetStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(3),
              ),
            ),
          ),
        ),
        cardTheme: const CardTheme().copyWith(
            margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
            color: kColorScheme.surface,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(0),
                side: const BorderSide().copyWith(
                    color: const Color.fromARGB(255, 247, 243, 243), width: 0)),
            elevation: 0),
      ),
      themeMode: ThemeMode.system,
      home: const Expenses(),
    ),
    // ),
  );
}
