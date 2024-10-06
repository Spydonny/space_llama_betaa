import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final darkTheme = ThemeData(
    cardColor: Colors.black45,
    colorScheme: const ColorScheme.dark(
        primary: Color.fromARGB(255, 0, 70, 230), // Сине-голубой
        secondary: Color.fromARGB(150, 72, 61, 139),
        secondaryContainer: Colors.white10,
        onPrimaryContainer: Colors.white10
    ),
    scaffoldBackgroundColor: const Color.fromARGB(255, 25, 25, 25),
    inputDecorationTheme: const InputDecorationTheme(
      enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white30)
      ),
      focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color.fromARGB(150, 72, 61, 139)) // Сине-фиолетовый
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          elevation: WidgetStateProperty.all<double>(1),
          backgroundColor: WidgetStateProperty.all<Color>(
              Colors.white12
          ),
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            ),
          ),
        )
    ),
    textTheme:GoogleFonts.dmSansTextTheme().copyWith(
      bodyLarge: GoogleFonts.dmSans(color: Colors.white),
      bodyMedium: GoogleFonts.dmSans(color: Colors.white),
      displayLarge: GoogleFonts.dmSans(color: Colors.white),
      displayMedium: GoogleFonts.dmSans(color: Colors.white),
      displaySmall: GoogleFonts.dmSans(color: Colors.white),
      headlineMedium: GoogleFonts.dmSans(color: Colors.white),
      headlineSmall: GoogleFonts.dmSans(color: Colors.white),
      titleLarge: GoogleFonts.dmSans(color: Colors.white),
      titleMedium: GoogleFonts.dmSans(color: Colors.white),
      titleSmall: GoogleFonts.dmSans(color: Colors.white),
      bodySmall: GoogleFonts.dmSans(color: Colors.white),
      labelLarge: GoogleFonts.dmSans(color: Colors.white),
      labelSmall: GoogleFonts.dmSans(color: Colors.white),
    ),
    iconTheme: const IconThemeData(
        color: Colors.white,
        size: 30
    ),
    useMaterial3: true
);

final lightTheme = ThemeData(
  cardColor: Colors.white38,
  colorScheme: const ColorScheme.light(
      primary: Color.fromARGB(255, 0, 70, 230), // Сине-голубой
      secondary: Color.fromARGB(200, 140, 160, 230),
      secondaryContainer: Colors.white54,
      onPrimaryContainer: Colors.white38
  ),
  navigationBarTheme: const NavigationBarThemeData(
      backgroundColor: Colors.white38
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.white38,
  ),
  scaffoldBackgroundColor: const Color.fromARGB(255, 230, 230, 240),
  inputDecorationTheme: const InputDecorationTheme(
    enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.black38)
    ),
    focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Color.fromARGB(200, 70, 130, 180),)
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        elevation: WidgetStateProperty.all<double>(0.5),
        backgroundColor: WidgetStateProperty.all<Color>(
            const Color.fromARGB(255, 240, 240, 240)
        ),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
        ),
      )
  ),
  textTheme: GoogleFonts.dmSansTextTheme(),
  iconTheme: const IconThemeData(
      color: Colors.black,
      size: 30
  ),
  useMaterial3: true,
);



