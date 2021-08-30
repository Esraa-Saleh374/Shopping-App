import 'package:shopping/providers/darkmode_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartEmpty extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Spacer(flex: 2),
        Image.asset("assets/images/empty.png", scale: 1.2),
        Spacer(),
        Text(
          'سله مشترياتك فارغه',
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.w700),
        ),
        SizedBox(height: 4),
        Text(
          '  يوجد منتجات كثيره في انتظارك يمكنك شرائها',
          textAlign: TextAlign.center,
          style: TextStyle(
              color: themeChange.darkTheme
                  ? Theme.of(context).disabledColor
                  : Colors.grey,
              fontSize: 18,
              fontWeight: FontWeight.w400),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: TextButton(
            onPressed: () {},
            child: Text("تسوق الأن",
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 18,
                    color: Theme.of(context).primaryColor)),
            style: ElevatedButton.styleFrom(
              primary: Theme.of(context).accentColor,
              onPrimary: Colors.black,
              fixedSize: Size(MediaQuery.of(context).size.width, 65),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
            ),
          ),
        ),
        Spacer(flex: 2),
      ],
    );
  }
}
