import 'package:shopping/screens/homepage.dart';
import 'package:shopping/screens/search.dart';
import 'package:shopping/screens/user_info.dart';
import 'package:flutter/material.dart';
import 'cart.dart';
import 'feeds.dart';

class BottomBarScreen extends StatefulWidget {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedPageIndex]['page'] as Widget,
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
                  label: ('مشترياتك '),
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
