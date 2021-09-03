import 'package:shopping/screens/auth/login.dart';
import 'package:shopping/screens/auth/register.dart';
import 'package:shopping/screens/brandes/brands_navigator.dart';
import 'package:shopping/config/const/themedata.dart';
import 'package:shopping/providers/cart_provider.dart';
import 'package:shopping/providers/favorite_provider.dart';
import 'package:shopping/providers/products_provider.dart';
import 'package:shopping/providers/darkmode_theme.dart';
import 'package:shopping/screens/bottom_bar.dart';
import 'package:shopping/screens/shopping/categor_feed.dart';
import 'package:shopping/screens/shopping/feeds.dart';
import 'package:shopping/screens/shopping/feeds_product_details.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// import 'package:flutter_localizations/flutter_localizations.dart';

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
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) {
            return themeProvider;
          },
        ),
        ChangeNotifierProvider(
          create: (_) {
            return Products();
          },
        ),
        ChangeNotifierProvider(
          create: (_) {
            return CartProvider();
          },
        ),
        ChangeNotifierProvider(
          create: (_) {
            return FavoritProvider();
          },
        ),
      ],
      child: Consumer<DarkThemeProvider>(builder: (context, themData, child) {
        return MaterialApp(
          // localizationsDelegates: [
          //   GlobalCupertinoLocalizations.delegate,
          //   GlobalMaterialLocalizations.delegate,
          //   GlobalWidgetsLocalizations.delegate,
          // ],
          // supportedLocales: [
          //   Locale("ar", "AE"), // OR Locale('ar', 'AE') OR Other RTL locales
          // ],
          // locale:
          //     Locale("ar", "AE"), // OR Locale('ar', 'AE') OR Other RTL locales,
          debugShowCheckedModeBanner: false,
          routes: {
            BrandNavigationRailScreen.routeName: (context) =>
                BrandNavigationRailScreen(),
            Feeds.routeName: (context) => Feeds(),
            Login.routeName: (context) => Login(),
            Register.routeName: (context) => Register(),
            CategoryFeedCsreens.routeName: (context) => CategoryFeedCsreens(),
            BottomBarScreen.routeName: (context) => BottomBarScreen(),
            FeedsProductDetails.routeName: (context) => FeedsProductDetails(),
          },
          title: ' ECommerce',
          theme: Styles.themeData(themeProvider.darkTheme, context),
          home: Login(),
        );
      }),
    );
  }
}
