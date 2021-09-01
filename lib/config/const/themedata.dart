import 'package:flutter/material.dart';

class Styles {
  static ThemeData themeData(bool isDarkTheme, BuildContext context) {
    return ThemeData(
      fontFamily: "Tajawal",
      scaffoldBackgroundColor:
          isDarkTheme ? Colors.black : Colors.grey.shade100,
      primarySwatch: Colors.purple,
      primaryColor: isDarkTheme ? Colors.black : Color(0xff784296),
      accentColor: Color(0xfff5e551),
      backgroundColor: isDarkTheme ? Colors.grey.shade700 : Colors.white24,
      indicatorColor: isDarkTheme ? Color(0xff0E1D36) : Color(0xffCBDCF8),
      buttonColor: isDarkTheme ? Color(0xff3B3B3B) : Color(0xffF1F5FB),
      hintColor: isDarkTheme ? Colors.grey.shade300 : Colors.grey.shade800,
      highlightColor: isDarkTheme ? Color(0xff372901) : Color(0xffFCE192),
      hoverColor: isDarkTheme ? Color(0xff3A3A3B) : Color(0xff4285F4),
      focusColor: isDarkTheme ? Color(0xff0B2512) : Color(0xffA8DAB5),
      disabledColor: Colors.grey,
      textSelectionTheme: TextSelectionThemeData(
          selectionColor: isDarkTheme ? Colors.white : Colors.grey.shade400),
      cardColor: isDarkTheme ? Color(0xFF151515) : Colors.white,
      canvasColor: isDarkTheme ? Colors.black : Colors.grey[50],
      brightness: isDarkTheme ? Brightness.dark : Brightness.light,
      buttonTheme: Theme.of(context).buttonTheme.copyWith(
          colorScheme: isDarkTheme ? ColorScheme.dark() : ColorScheme.light()),
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        elevation: 0.0,
      ),
    );
  }
}
