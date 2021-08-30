import 'package:flutter/material.dart';
import 'package:shopping/providers/darkmode_theme.dart';
import 'package:shopping/screens/feeds.dart';

import 'package:provider/provider.dart';

class EmptyFevorit extends StatelessWidget {
  Widget build(BuildContext context) {
    final prov = Provider.of<DarkThemeProvider>(context);
    return Scaffold(
      body: ListView(
        scrollDirection: Axis.vertical,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(top: 120),
                width: double.infinity,
                height: MediaQuery.of(context).size.height / 3,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                        "https://azaong.com/img/core-img/jhjhjh.png"),
                  ),
                ),
              ),
              Text(
                " قائمه المفضلات لديك فارغه ",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 25,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                'يوجد منتجات كثيره يمكنك اضافتها الي قائمه المفضلات الان',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 30),
                width: MediaQuery.of(context).size.width * 4,
                height: MediaQuery.of(context).size.height * .06,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Theme.of(context).accentColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  onPressed: () {
                    Navigator.of(context).pushNamed(Feeds.routeName);
                  },
                  child: Text(
                    "اضف الان ".toUpperCase(),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.purple,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
