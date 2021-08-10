import 'package:flutter/material.dart';

class ShowDailog {
  Future<void> showTheDialog(
      String title, String subtitle, Function fun, BuildContext context) async {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(title),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.network(
                  'https://image.flaticon.com/icons/png/128/564/564619.png',
                  height: 30,
                  width: 30,
                ),
              ),
            ],
          ),
          content: Padding(
            padding: const EdgeInsets.only(left: 40),
            child: Text(subtitle),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("رجوع  "),
            ),
            TextButton(
              onPressed: () {
                fun();
                Navigator.of(context).pop();
              },
              child: Text(
                "حذف ",
                style: TextStyle(color: Colors.red),
              ),
            )
          ],
        );
      },
    );
  }

  Future<void> authErrorHandle(String subtitle, BuildContext context) async {
    showDialog(
        context: context,
        builder: (BuildContext ctx) {
          return AlertDialog(
            title: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 6.0),
                  child: Image.network(
                    'https://image.flaticon.com/icons/png/128/564/564619.png',
                    height: 20,
                    width: 20,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Error occured'),
                ),
              ],
            ),
            content: Text(subtitle),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Ok'))
            ],
          );
        });
  }
}
