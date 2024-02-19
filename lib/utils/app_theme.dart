import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();
  /* 
 black #252222
blue #689BF7
green #OFAA58
purple #A848F8
 orange #F96357
red #F43600
report banner: 1C5871
   */

  static Color red = Colors.red.shade700;
  static final Color _iconColor = Colors.blueAccent.shade200;
  static const Color lightPrimaryColor = Color(0xFF447fff);
  static const Color _lightPrimaryVariantColor =
      Color.fromARGB(255, 10, 76, 152);

  static const Color primaryTextColor = Color(0xFF475473);
  static const Color secondaryTextColor = Color(0xFF8193b5);
  static const Color primaryButtonColor = Color(0xFF706DFF);
  static const Color textBackgroundColor = Color(0xFFF2F4FF);
  static const Color darkSecondaryColor = Color(0xFF1C5871);
  static const Color categoryColor = Color(0xFFFF7F50);
  static Color greyBorderColor = Colors.grey.shade300;

  // static const Color _lightSecondaryColor = Colors.green;
  static const Color _lightOnPrimaryColor = Color(0xFF252222);

  static const Color _darkPrimaryColor = Colors.white24;
  static const Color _darkPrimaryVariantColor = Colors.black;
  static const Color _darkSecondaryColor = Colors.white;
  static const Color _darkOnPrimaryColor = Colors.white;

  static final ThemeData lightTheme = ThemeData(
      useMaterial3: true,
      dividerColor: Colors.transparent,
      appBarTheme: const AppBarTheme(
        titleTextStyle: TextStyle(
            color: _darkSecondaryColor,
            fontFamily: "Roboto",
            fontWeight: FontWeight.bold,
            fontSize: 26),
        color: _lightPrimaryVariantColor,
        iconTheme: IconThemeData(color: lightPrimaryColor),
      ),
      unselectedWidgetColor: lightPrimaryColor,
      colorScheme: const ColorScheme.light(
        primary: lightPrimaryColor,
        secondary: lightPrimaryColor,
        onPrimary: _lightOnPrimaryColor,
      ),
      iconTheme: const IconThemeData(
        color: _lightPrimaryVariantColor,
      ),
      buttonTheme: const ButtonThemeData(buttonColor: primaryButtonColor),
      textTheme: _lightTextTheme,
      dividerTheme: const DividerThemeData(color: Colors.black12));

  static final ThemeData darkTheme = ThemeData(
      scaffoldBackgroundColor: _darkPrimaryVariantColor,
      appBarTheme: const AppBarTheme(
        color: _darkPrimaryVariantColor,
        iconTheme: IconThemeData(color: _darkOnPrimaryColor),
      ),
      colorScheme: const ColorScheme.dark(
        primary: _darkPrimaryColor,
        secondary: _darkSecondaryColor,
        onPrimary: _darkOnPrimaryColor,
        background: Colors.white12,
      ),
      iconTheme: IconThemeData(
        color: _iconColor,
      ),
      buttonTheme: const ButtonThemeData(buttonColor: primaryButtonColor),
      textTheme: _darkTextTheme,
      dividerTheme: const DividerThemeData(color: Colors.black));

  static const TextTheme _lightTextTheme = TextTheme(
    displayLarge: _lightScreenHeading1TextStyle,
  );

  static final TextTheme _darkTextTheme = TextTheme(
    displayLarge: _darkScreenHeading1TextStyle,
  );

  static const TextStyle _lightScreenHeading1TextStyle = TextStyle(
      fontSize: 26.0,
      fontWeight: FontWeight.bold,
      color: primaryTextColor,
      fontFamily: "Roboto");

  static final TextStyle _darkScreenHeading1TextStyle =
      _lightScreenHeading1TextStyle.copyWith(color: _darkOnPrimaryColor);
}
