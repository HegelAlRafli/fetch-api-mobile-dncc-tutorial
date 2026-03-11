import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'color_value.dart';

class AppThemeData {
  static ThemeData getThemeLight() {
    const Color primaryColor = ColorValue.primaryColor;
    final Map<int, Color> primaryColorMap = {
      50: primaryColor,
      100: primaryColor,
      200: primaryColor,
      300: primaryColor,
      400: primaryColor,
      500: primaryColor,
      600: primaryColor,
      700: primaryColor,
      800: primaryColor,
      900: primaryColor,
    };

    final primaryMaterialColor = MaterialColor(
      primaryColor.value,
      primaryColorMap,
    );

    return ThemeData(
      primaryColor: primaryColor,
      primarySwatch: primaryMaterialColor,
      brightness: Brightness.light,
      scaffoldBackgroundColor: Colors.white,
      appBarTheme: AppBarTheme(
        elevation: 0,
        titleTextStyle: GoogleFonts.poppins(
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: ColorValue.primaryColor,
          minimumSize: Size(double.infinity, 48),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          textStyle: GoogleFonts.poppins(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      textTheme: TextTheme(
        displayLarge: GoogleFonts.poppins(
          fontSize: 93,
          fontWeight: FontWeight.w300,
        ),
        displayMedium: GoogleFonts.poppins(
          fontSize: 58,
          fontWeight: FontWeight.w300,
        ),
        displaySmall: GoogleFonts.poppins(
          fontSize: 47,
          fontWeight: FontWeight.w400,
        ),
        headlineMedium: GoogleFonts.poppins(
          fontSize: 33,
          fontWeight: FontWeight.w400,
        ),
        headlineSmall: GoogleFonts.poppins(fontSize: 23),
        titleLarge: GoogleFonts.poppins(
          fontSize: 19,
          fontWeight: FontWeight.w500,
        ),
        titleMedium: GoogleFonts.poppins(
          fontSize: 16,
          fontWeight: FontWeight.w400,
        ),
        titleSmall: GoogleFonts.poppins(
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
        bodyLarge: GoogleFonts.poppins(
          fontSize: 16,
          fontWeight: FontWeight.w400,
        ),
        bodyMedium: GoogleFonts.poppins(
          fontSize: 14,
          fontWeight: FontWeight.w400,
        ),
        labelLarge: GoogleFonts.poppins(
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
        bodySmall: GoogleFonts.poppins(
          color: ColorValue.greyColor,
          fontSize: 12,
          fontWeight: FontWeight.w400,
        ),
        labelSmall: GoogleFonts.poppins(
          fontSize: 10,
          fontWeight: FontWeight.w400,
          color: ColorValue.greyTextColor,
        ),
      ),
    );
  }
}
