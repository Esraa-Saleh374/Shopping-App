import 'package:badges/badges.dart';
import 'package:shopping/providers/cart_provider.dart';
import 'package:shopping/providers/favorite_provider.dart';
import 'package:shopping/providers/darkmode_theme.dart';
import 'package:shopping/screens/cart.dart';
import 'package:shopping/screens/favorit.dart';
import 'package:flutter/material.dart';
import 'package:list_tile_switch/list_tile_switch.dart';
import 'package:provider/provider.dart';

class UserInfo extends StatefulWidget {
  @override
  _UserInfoState createState() => _UserInfoState();
}

class _UserInfoState extends State<UserInfo> {
  ScrollController? _scrollController;
  var top = 0;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController!.addListener(() {
      setState(() {});
    });
  }

  Widget listTile(String text, String subtext, IconData icon) {
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
          subtitle: Text(
            subtext,
            textDirection: TextDirection.rtl,
          ),
        ),
      ),
    );
  }

  Widget header(String text) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Text(
            text,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
        ),
        Divider(
          color: Colors.grey,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<DarkThemeProvider>(context);
    final favProvider = Provider.of<FavoritProvider>(context);
    final cartProvider = Provider.of<CartProvider>(context);
    return Scaffold(
      body: ListView(
        scrollDirection: Axis.vertical,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  width: 250,
                  height: 200,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: NetworkImage(
                        'https://imcut.jollychic.com//uploads/jollyimg/imageLibrary/201903/8SV/03/IL201903032021362101.jpg',
                      ),
                    ),
                  ),
                ),
              ),
              header("المحتوي"),
              Consumer<FavoritProvider>(
                builder: (_, fav, ch) => Badge(
                    badgeColor: Colors.purple[200]!,
                    animationType: BadgeAnimationType.slide,
                    toAnimate: true,
                    position: BadgePosition.topEnd(top: 4, end: 5),
                    badgeContent:
                        Text(favProvider.getFavoritItem.length.toString()),
                    child: ListTile(
                      title: Text(
                        "المفضله ",
                        textDirection: TextDirection.rtl,
                      ),
                      trailing: Icon(
                        Icons.favorite,
                        size: 30,
                        color: Colors.purple,
                      ),
                      leading: Icon(Icons.chevron_left),
                      onTap: () {
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => Fevorit()));
                      },
                    )),
              ),
              Consumer<FavoritProvider>(
                builder: (_, fav, ch) => Badge(
                  badgeColor: Colors.purple[200]!,
                  animationType: BadgeAnimationType.slide,
                  toAnimate: true,
                  position: BadgePosition.topEnd(top: 4, end: 5),
                  badgeContent:
                      Text(cartProvider.getCartItem.length.toString()),
                  child: ListTile(
                    title: Text(
                      "عربه التسوق",
                      textDirection: TextDirection.rtl,
                    ),
                    trailing: Icon(
                      Icons.shopping_cart_sharp,
                      size: 30,
                      color: Colors.purple,
                    ),
                    leading: Icon(Icons.chevron_left),
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => CartScreen()));
                    },
                  ),
                ),
              ),
              header(" معلومات المستخدم "),
              listTile("الايميل ", "Sub Email", Icons.email),
              listTile("رقم الموبيل ", "SubPhone ", Icons.phone),
              listTile(" العنوان", " sub Shipping", Icons.shop),
              listTile("تاريخ الانضمام", "data", Icons.date_range),
              header("اعدادات المستخدم "),
              ListTileSwitch(
                value: prov.darkTheme,
                leading: Icon(Icons.nights_stay_outlined),
                onChanged: (value) {
                  setState(() {
                    prov.darkTheme = value;
                  });
                },
                visualDensity: VisualDensity.comfortable,
                switchType: SwitchType.cupertino,
                switchActiveColor: Colors.indigo,
                title: Text(
                  'الوضع المظلم',
                  textDirection: TextDirection.rtl,
                ),
              ),
              ListTile(
                title: Text(
                  "تسجيل الخروج ",
                  textDirection: TextDirection.rtl,
                ),
                trailing: Icon(Icons.logout),
                leading: Icon(Icons.chevron_left),
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ],
      ),
      //to edit account
      floatingActionButton: Align(
        alignment: Alignment(-.8, 1),
        child: FloatingActionButton(
          onPressed: () {},
          child: RotationTransition(
            turns: AlwaysStoppedAnimation(.76),
            child: Icon(
              Icons.edit_outlined,
              size: 35,
            ),
          ),
        ),
      ),
    );
  }
}
