import 'package:dotted_line/dotted_line.dart';
import 'package:shopping/widgets/category/appbar.dart';
import 'package:shopping/providers/cart_provider.dart';
import 'package:shopping/screens/shopping/cart_fall.dart';
import 'package:shopping/screens/shopping/empty_cart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
                        color: Theme.of(ctx).primaryColor),
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        borderRadius: BorderRadius.circular(30),
                        onTap: () {},
                        splashColor: Theme.of(ctx).splashColor,
                        child: Padding(
                          padding: const EdgeInsets.all(0.0),
                          child: Text(
                            'الدفع',
                            strutStyle: StrutStyle(forceStrutHeight: true),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.white,
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

    Widget detailCart(IconData icon, String text,
        {bool currentSelected = false}) {
      return Expanded(
        flex: 2,
        child: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {},
                child: Container(
                    width: 70,
                    height: 70,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: currentSelected
                          ? Theme.of(context).primaryColor
                          : Colors.grey.shade400,
                    ),
                    child: Icon(
                      icon,
                      color: currentSelected
                          ? Theme.of(context).accentColor
                          : Colors.white,
                      size: 40,
                    )),
              ),
              SizedBox(
                height: 4,
              ),
              Text(
                text,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      );
    }

    Widget dashLine() {
      return Expanded(
          flex: 2,
          child: DottedLine(
            direction: Axis.horizontal,
            dashColor: Colors.purple,
          ));
    }

    return cartProvider.getCartItem.isEmpty
        ? Scaffold(body: CartEmpty())
        : Scaffold(
            // bottomSheet: checkoutSection(context),
            body: ShowappBar(
              hight: 80,
              child: Padding(
                padding: const EdgeInsets.only(top: 50),
                child: Column(
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(right: 8, left: 8, bottom: 10),
                      child: Container(
                        width: double.infinity,
                        height: 118,
                        child: Row(
                          children: [
                            detailCart(Icons.payment_outlined, 'تفاصيل الدفع'),
                            dashLine(),
                            detailCart(Icons.pin_drop, "تفاصيل الشحن"),
                            dashLine(),
                            detailCart(
                              Icons.shopping_bag,
                              "تفاصيل الطلب",
                              currentSelected: true,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.56,
                      child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: cartProvider.getCartItem.length,
                          itemBuilder: (BuildContext ctx, int index) {
                            return ChangeNotifierProvider.value(
                              value: cartProvider.getCartItem.values
                                  .toList()[index],
                              child: CartFull(
                                productId: cartProvider.getCartItem.keys
                                    .toList()[index],
                              ),
                            );
                          }),
                    ),
                  ],
                ),
              ),
            ),
          );
  }
}
