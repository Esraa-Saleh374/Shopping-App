import 'package:flutter/material.dart';
import 'package:shopping/widgets/category/appbar.dart';

class DrawerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget listTile(String text, IconData icon) {
      return Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(28),
          child: ListTile(
            trailing: Icon(icon),
            title: Text(
              text,
              textDirection: TextDirection.rtl,
            ),
          ),
        ),
      );
    }

    return Drawer(
      child: ShowappBar(
          hight: 350,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 60, bottom: 20),
                child: Text(
                  "اهلا ومرحبا بك :  الاسم   ",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 18),
                ),
              ),
              Material(
                color: Colors.transparent,
                child: InkWell(
                  borderRadius: BorderRadius.circular(4.0),
                  child: Container(
                    width: 200,
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(45),
                      color: Colors.yellow,
                    ),
                    child: TextButton(
                      onPressed: () {},
                      child: Text(
                        "دعنا نتسوق عنك!",
                        textDirection: TextDirection.rtl,
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 18),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Expanded(
                // height: 200,
                child: ListView(
                  physics: AlwaysScrollableScrollPhysics(
                      parent: BouncingScrollPhysics()),
                  controller: ScrollController(),
                  children: [
                    listTile("الرئيسيه", Icons.home_outlined),
                    listTile('البحث ', Icons.search_outlined),
                    listTile('مشترياتك', Icons.shopping_cart_outlined),
                    listTile('الاقسام ', Icons.apps_outlined),
                    listTile('حسابي ', Icons.person),
                    listTile("المفضله ", Icons.favorite_outline),
                    listTile('حاله الطلب ', Icons.stacked_bar_chart),
                    listTile("من نحن", Icons.error_outline),
                  ],
                ),
              )
            ],
          )),
    );
  }
}
