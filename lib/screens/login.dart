import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shopping/screens/register.dart';

class Login extends StatefulWidget {
  static const routeName = "login";
  Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool showPassword = false;
  bool rememberMe = false;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: GestureDetector(
        onTap: FocusScope.of(context).unfocus,
        child: SingleChildScrollView(
          child: Container(
            height: height,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Column(
                  children: [
                    Flexible(
                      child: Container(
                        color: Colors.purple[700],
                      ),
                      flex: 3,
                    ),
                    Flexible(
                      child: Container(
                        color: Colors.grey[200],
                      ),
                      flex: 4,
                    )
                  ],
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(15))),
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  padding: EdgeInsets.symmetric(vertical: 28, horizontal: 15),
                  width: double.infinity,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "تسجيل الدخول",
                        style: Theme.of(context)
                            .textTheme
                            .subtitle1!
                            .copyWith(fontWeight: FontWeight.w700),
                      ),
                      SizedBox(height: 16),
                      // --------------------------------
                      Align(
                        child: Text("رقم الهاتف  ",
                            style: Theme.of(context).textTheme.subtitle1),
                        alignment: Alignment.centerRight,
                      ),
                      SizedBox(height: 8),
                      TextField(
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        cursorColor: Colors.black26,
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.phone_outlined,
                            color: Colors.grey,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            borderSide: BorderSide(color: Colors.grey.shade300),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            borderSide: BorderSide(color: Colors.black54),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            borderSide: BorderSide(color: Colors.red),
                          ),
                        ),
                      ),
                      // --------------------------------
                      SizedBox(height: 16),
                      // --------------------------------
                      Align(
                        child: Text("كلمة المرور",
                            style: Theme.of(context).textTheme.subtitle1),
                        alignment: Alignment.centerRight,
                      ),
                      SizedBox(height: 8),
                      TextField(
                        obscureText: showPassword,
                        cursorColor: Colors.black26,
                        decoration: InputDecoration(
                          prefixIcon: IconButton(
                              onPressed: () => setState(() {
                                    showPassword = !showPassword;
                                  }),
                              icon: Icon(
                                showPassword
                                    ? Icons.visibility_off_outlined
                                    : Icons.visibility_outlined,
                                color: Colors.grey,
                              )),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            borderSide: BorderSide(color: Colors.grey.shade300),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            borderSide: BorderSide(color: Colors.black54),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            borderSide: BorderSide(color: Colors.red),
                          ),
                        ),
                      ),
                      SizedBox(height: 8),
                      Align(
                        child: Text("هل نسيت كلمة المرور؟",
                            style: Theme.of(context)
                                .textTheme
                                .caption!
                                .copyWith(
                                    color: Colors.grey.shade700,
                                    fontWeight: FontWeight.w600)),
                        alignment: Alignment.centerLeft,
                      ),
                      // --------------------------------
                      SizedBox(height: 8),
                      // --------------------------------
                      Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                        Align(
                          child: Text("تذكر معلوماتي",
                              strutStyle: StrutStyle(forceStrutHeight: true),
                              style: Theme.of(context).textTheme.subtitle1),
                          alignment: Alignment.centerRight,
                        ),
                        Checkbox(
                          fillColor: MaterialStateProperty.all(
                              Theme.of(context).primaryColor),
                          materialTapTargetSize:
                              MaterialTapTargetSize.shrinkWrap,
                          value: rememberMe,
                          onChanged: (val) {
                            setState(() {
                              rememberMe = val!;
                            });
                          },
                        ),
                      ]),
                      // --------------------------------
                      SizedBox(height: 16),
                      // --------------------------------
                      TextButton(
                        onPressed: () {
                          print("login");
                        },
                        child: Text("تسجيل الدخول"),
                        style: ElevatedButton.styleFrom(
                          primary: Theme.of(context).accentColor,
                          onPrimary: Colors.black,

                          fixedSize:
                              Size(MediaQuery.of(context).size.width, 65),
                          // padding:
                          // EdgeInsets.symmetric(horizontal: 100, vertical: 20),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                        ),
                      ),
                      // --------------------------------
                      SizedBox(height: 24),
                      // --------------------------------
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () => Navigator.of(context)
                                  .pushReplacementNamed(Register.routeName),
                              child: Text(
                                "سجل الأن",
                                style: TextStyle(
                                    color: Theme.of(context).primaryColor,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            SizedBox(width: 8),
                            Text(
                              "لا تملك حساب؟",
                              style: TextStyle(color: Colors.grey.shade700),
                            ),
                          ])
                    ],
                  ),
                ),
                Positioned(
                  bottom: MediaQuery.of(context).size.height * 0.08,
                  child: GestureDetector(
                    child: Row(
                      children: [
                        Icon(
                          Icons.arrow_back,
                          color: Theme.of(context).primaryColor,
                        ),
                        SizedBox(width: 8),
                        Text(
                          "الدخول كزائر",
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              color: Theme.of(context).primaryColor),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
