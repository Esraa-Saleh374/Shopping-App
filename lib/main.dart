import 'package:shopping/screens/brandes/brands_navigator.dart';
import 'package:shopping/config/const/themedata.dart';
import 'package:shopping/providers/cart_provider.dart';
import 'package:shopping/providers/favorite_provider.dart';
import 'package:shopping/providers/products_provider.dart';
import 'package:shopping/providers/darkmode_theme.dart';
import 'package:shopping/screens/bottom_bar.dart';
import 'package:shopping/screens/categor_feed.dart';
import 'package:shopping/screens/auth/login.dart';

import 'package:shopping/screens/feeds.dart';
import 'package:shopping/screens/feeds_product_details.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
          debugShowCheckedModeBanner: false,
          routes: {
            BrandNavigationRailScreen.routeName: (context) =>
                BrandNavigationRailScreen(),
            Feeds.routeName: (context) => Feeds(),
            CategoryFeedCsreens.routeName: (context) => CategoryFeedCsreens(),
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
