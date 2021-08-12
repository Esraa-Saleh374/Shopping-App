import 'package:flutter/material.dart';
import 'package:shopping/config/const/themedata.dart';
import 'package:shopping/providers/darkmode_theme.dart';
import 'package:shopping/screens/login.dart';
import 'package:shopping/screens/register.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  DarkThemeProvider themeProvider = DarkThemeProvider();
  void getCurrentTheme() async {
    themeProvider.darkTheme =
        await themeProvider.darkThemePreferences.getTheme();
  }

  @override
  void initState() {
    getCurrentTheme();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        Login.routeName: (context) => Login(),
        Register.routeName: (context) => Register(),
      },
      title: ' ECommerce',
      theme: Styles.themeData(themeProvider.darkTheme, context),
      home: Login(),
    );
  }
}
