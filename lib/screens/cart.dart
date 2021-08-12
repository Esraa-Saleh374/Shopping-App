import 'package:shopping/screens/favorit.dart';
import 'package:shopping/widgets/category/appbar.dart';
import 'package:shopping/providers/cart_provider.dart';
import 'package:shopping/screens/cart_fall.dart';
import 'package:shopping/screens/empty_cart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping/widgets/drawer_screen.dart';

class CartScreen extends StatelessWidget {
  static const routeName = '/CartScreen';

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
    final cartProvider = Provider.of<CartProvider>(context);
    Future<void> _showDialog(
        String title, String subtitle, Function fun) async {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.network(
                      "https://c0.klipartz.com/pngpicture/982/781/gratis-png-senal-de-advertencia-de-peligro-etiqueta-de-advertencia-de-seguridad-senales.png",
                      height: 30,
                      width: 30,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(title),
                  ),
                ],
              ),
              content: Text(subtitle),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text("Cancel "),
                ),
                TextButton(
                  onPressed: () {
                    fun();
                    Navigator.of(context).pop();
                  },
                  child: Text("Ok "),
                )
              ],
            );
          });
    }

    return cartProvider.getCartItem.isEmpty
        ? Scaffold(body: CartEmpty())
        : Scaffold(
            bottomSheet: checkoutSection(context),
            appBar: AppBar(
              iconTheme: IconThemeData(color: Colors.white),
              backgroundColor: Color.fromARGB(255, 120, 66, 150),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  iconAppBar(
                    Icons.notifications_outlined,
                    () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => Fevorit()));
                    },
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  iconAppBar(
                    Icons.favorite_outline,
                    () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => Fevorit()));
                    },
                  )
                ],
              ),
            ),
            endDrawer: DrawerScreen(),
            body: ShowappBar(
              hight: 80,
              child: Padding(
                padding: const EdgeInsets.only(top: 50),
                child: Container(
                  margin: EdgeInsets.only(bottom: 60),
                  child: ListView.builder(
                      itemCount: cartProvider.getCartItem.length,
                      itemBuilder: (BuildContext ctx, int index) {
                        return ChangeNotifierProvider.value(
                          value:
                              cartProvider.getCartItem.values.toList()[index],
                          child: CartFull(
                            productId:
                                cartProvider.getCartItem.keys.toList()[index],
                          ),
                        );
                      }),
                ),
              ),
            ),
          );
  }

  Widget checkoutSection(BuildContext ctx) {
    final getTotalPrice = Provider.of<CartProvider>(ctx);

    return Container(
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(color: Colors.grey, width: 0.5),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Text(
                'US ${getTotalPrice.totalAmmount}',
                //textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.blue,
                    fontSize: 18,
                    fontWeight: FontWeight.w500),
              ),
              Text(
                ':التكلفه ',
                style: TextStyle(
                    color: Theme.of(ctx).textSelectionTheme.selectionColor,
                    fontSize: 18,
                    fontWeight: FontWeight.w600),
              ),
              Spacer(),
              Expanded(
                flex: 2,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    gradient: LinearGradient(colors: <Color>[
                      Colors.purple[400]!,
                      Colors.pink[300]!,
                    ], stops: [
                      0.0,
                      0.7
                    ]),
                  ),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(30),
                      onTap: () {},
                      splashColor: Theme.of(ctx).splashColor,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'الدفع',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Theme.of(ctx)
                                  .textSelectionTheme
                                  .selectionColor,
                              fontSize: 18,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
