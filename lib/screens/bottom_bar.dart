import 'package:shopping/screens/shopping/favorit.dart';
import 'package:shopping/screens/homepage.dart';
import 'package:shopping/screens/shopping/search.dart';
import 'package:shopping/screens/settings/user_info.dart';
import 'package:flutter/material.dart';
import 'package:shopping/widgets/drawer_screen.dart';
import 'package:shopping/screens/shopping/cart.dart';
import 'package:shopping/screens/shopping/feeds.dart';

class BottomBarScreen extends StatefulWidget {
  static const routeName = "bottom_bar";
  @override
  _BottomBarScreenState createState() => _BottomBarScreenState();
}

class _BottomBarScreenState extends State<BottomBarScreen> {
  List<Map<String, Object>> _pages = [];
  int _selectedPageIndex = 4;

  @override
  void initState() {
    _pages = [
      {
        'page': UserInfo(),
      },
      {
        'page': Feeds(),
      },
      {
        'page': CartScreen(),
      },
      {
        'page': Search(),
      },
      {
        'page': HomePage(),
      },
    ];
    super.initState();
  }

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  Widget iconAppBar(IconData icon, Function tap) {
    return InkWell(
      onTap: () => tap(),
      child: Icon(
        icon,
        color: Colors.yellow,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Color.fromARGB(255, 120, 66, 150),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            iconAppBar(
              Icons.notifications_outlined,
              () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => Fevorit()));
              },
            ),
            SizedBox(
              width: 10,
            ),
            iconAppBar(
              Icons.favorite_outline,
              () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => Fevorit()));
              },
            )
          ],
        ),
      ),
      body: _pages[_selectedPageIndex]['page'] as Widget,
      endDrawer: DrawerScreen(_selectedPageIndex),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 0.01,
        clipBehavior: Clip.antiAlias,
        child: Container(
          child: Container(
            decoration: BoxDecoration(
              // color: Colors.red,
              border: Border(
                top: BorderSide(
                  color: Colors.grey,
                  width: .7,
                ),
              ),
            ),
            child: BottomNavigationBar(
              onTap: _selectPage,
              backgroundColor: Theme.of(context).primaryColor,
              selectedItemColor: Colors.purple,
              unselectedItemColor: Colors.grey,
              currentIndex: _selectedPageIndex,
              showUnselectedLabels: true,
              items: [
                BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  label: ('حساب'),
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.grid_view),
                  label: ('الاقسام'),
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.shopping_cart_outlined,
                  ),
                  label: ('مشترياتك'),
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.search),
                  label: ('البحث'),
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: ('الرئيسيه'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
