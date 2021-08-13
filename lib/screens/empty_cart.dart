import 'package:shopping/providers/darkmode_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartEmpty extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context);
    return ListView(
      scrollDirection: Axis.vertical,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(top: 80),
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.34,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage("assets/images/empty.png"),
                ),
              ),
            ),
            Text(
              'سله مشترياتك فاضيه',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Theme.of(context).textSelectionTheme.selectionColor,
                  fontSize: 36,
                  fontWeight: FontWeight.w600),
            ),
            Text(
              '  يوجد منتجات كثيره في انتظارك يمكنك شرائها',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: themeChange.darkTheme
                      ? Theme.of(context).disabledColor
                      : Colors.grey,
                  fontSize: 26,
                  fontWeight: FontWeight.w600),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.9,
              height: MediaQuery.of(context).size.height * 0.06,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Theme.of(context).accentColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                    side: BorderSide(color: Colors.yellow),
                  ),
                ),
                onPressed: () {},
                child: Text(
                  'تسوق الان '.toUpperCase(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color:
                          Theme.of(context).textSelectionTheme.selectionColor,
                      fontSize: 26,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
