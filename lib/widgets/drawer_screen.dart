import 'package:flutter/material.dart';
import 'package:shopping/widgets/category/appbar.dart';

class DrawerScreen extends StatefulWidget {
  int selectedDestination;
  DrawerScreen(this.selectedDestination);
  @override
  _DrawerScreenState createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  @override
  Widget build(BuildContext context) {
    Widget listTile(String text, IconData icon, Function tap, bool select) {
      return Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(28),
          child: ListTile(
            selected: select,
            onTap: () => tap(),
            trailing: Icon(icon),
            title: Text(
              text,
              textDirection: TextDirection.rtl,
            ),
          ),
        ),
      );
    }

    //  int selectedDestination = 0;

    void selectDestination(int index) {
      setState(() {
        widget.selectedDestination = index;
      });
    }

    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    return Drawer(
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: 1,
        itemBuilder: (context, index) => Column(
          children: [
            ShowappBar(
                hight: 350,
                child: Center(
                  child: Column(
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
                      listTile(
                        "الرئيسيه",
                        Icons.home_outlined,
                        () => selectDestination(4),
                        widget.selectedDestination == 4,
                      ),
                      listTile(
                        'البحث ',
                        Icons.search_outlined,
                        () => selectDestination(3),
                        widget.selectedDestination == 3,
                      ),
                      listTile(
                        'مشترياتك',
                        Icons.shopping_cart_outlined,
                        () => selectDestination(2),
                        widget.selectedDestination == 2,
                      ),
                      listTile(
                        'الاقسام ',
                        Icons.apps_outlined,
                        () => selectDestination(1),
                        widget.selectedDestination == 1,
                      ),
                      listTile(
                        'حسابي ',
                        Icons.person,
                        () => selectDestination(0),
                        widget.selectedDestination == 0,
                      ),
                      listTile(
                        "المفضله ",
                        Icons.favorite_outline,
                        () => selectDestination(5),
                        widget.selectedDestination == 5,
                      ),
                      listTile(
                        'حاله الطلب ',
                        Icons.stacked_bar_chart,
                        () => selectDestination(6),
                        widget.selectedDestination == 6,
                      ),
                      listTile(
                        "من نحن",
                        Icons.error_outline,
                        () => selectDestination(7),
                        widget.selectedDestination == 7,
                      ),
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
