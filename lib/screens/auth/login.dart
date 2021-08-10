import 'package:flutter/material.dart';
import 'package:shopping/widgets/category/appbar.dart';

class LogInScreen extends StatefulWidget {
  @override
  _LogInScreenState createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  Widget text(String title) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w500,
      ),
    );
  }

  TextEditingController? _searchTextController;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ShowappBar(
        hight: 500,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 120),
          child: Card(
            child: Container(
              width: double.infinity,
              //   color: Colors.red,
              height: 400,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Center(
                      child: Text(
                        "تسجيل الدخول ",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    text(
                      "رقم الهاتف ",
                    ),
                    TextField(
                      controller: _searchTextController,
                      minLines: 1,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            width: 0,
                          ),
                        ),
                        filled: true,
                        fillColor: Theme.of(context).cardColor,
                      ),
                    ),
                    text("كلمه المرور ")
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
