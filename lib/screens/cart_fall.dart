import 'package:shopping/models/cart_attribute.dart';
import 'package:shopping/providers/cart_provider.dart';
import 'package:shopping/screens/feeds_product_details.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartFull extends StatefulWidget {
  final String productId;

  const CartFull({required this.productId});

  @override
  _CartFullState createState() => _CartFullState();
}

class _CartFullState extends State<CartFull> {
  Widget showproducDetail(String value) {
    return Text(
      " $value دينار",
      textDirection: TextDirection.rtl,
      style: TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.w600,
        color: Colors.black,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Future<void> _showDialog(
        String title, String subtitle, Function fun) async {
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
                      "https://c0.klipartz.com/pngpicture/982/781/gratis-png-senal-de-advertencia-de-peligro-etiqueta-de-advertencia-de-seguridad-senales.png",
                      height: 30,
                      width: 30,
                    ),
                  ),
                ],
              ),
              content: Text(subtitle),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text("رجوع"),
                ),
                TextButton(
                  onPressed: () {
                    fun();
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    "حذف ",
                    style: TextStyle(
                      color: Colors.red,
                    ),
                  ),
                )
              ],
            );
          });
    }

    // final themeChange = Provider.of<DarkThemeProvider>(context);
    final cartAttr = Provider.of<CartAttr>(context);
    final cartProvider = Provider.of<CartProvider>(context);
    double subTotal = cartAttr.price * cartAttr.quantity;
    return InkWell(
      onTap: () => Navigator.pushNamed(context, FeedsProductDetails.routeName,
          arguments: widget.productId),
      child: Container(
        height: 130,
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 0,
              offset: Offset(1.5, 1.5), // changes position of shadow
            ),
          ],
        ),
        child: Row(
          children: [
            Flexible(
              child: Padding(
                padding: const EdgeInsets.all(2.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Material(
                          color: Colors.transparent,
                          child: InkWell(
                            borderRadius: BorderRadius.circular(32.0),
                            // splashColor: ,
                            onTap: () {
                              _showDialog("!حذف العنصر",
                                  "هذا المنتج سوف يتم حذفه من عربيه التسوق",
                                  () {
                                cartProvider.removeitem(widget.productId);
                              });
                            },
                            child: Container(
                              height: 50,
                              width: 50,
                              child: Icon(
                                Icons.close,
                                color: Colors.grey,
                                size: 22,
                              ),
                            ),
                          ),
                        ),
                        Flexible(
                          child: Text(
                            cartAttr.title,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w800,
                                fontSize: 18),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Flexible(
                          flex: 1,
                          child: Container(
                            height: 33,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                width: 1,
                                color: Colors.black45,
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Material(
                                  color: Colors.transparent,
                                  child: InkWell(
                                    borderRadius: BorderRadius.circular(4.0),
                                    onTap: cartAttr.quantity < 2
                                        ? null
                                        : () {
                                            cartProvider.reduceProductToCart(
                                              widget.productId,
                                              cartAttr.price,
                                              cartAttr.title,
                                              cartAttr.imageUrl,
                                              cartAttr.offer,
                                            );
                                          },
                                    child: Container(
                                      child: Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: Icon(
                                          Icons.remove,
                                          color: cartAttr.quantity < 2
                                              ? Colors.grey
                                              : Colors.red,
                                          size: 22,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Row(
                                  children: [
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.1,
                                      padding: const EdgeInsets.all(8.0),
                                      decoration: BoxDecoration(),
                                      child: Text(
                                        cartAttr.quantity.toString(),
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Material(
                                  color: Colors.transparent,
                                  child: InkWell(
                                    borderRadius: BorderRadius.circular(4.0),
                                    onTap: () {
                                      cartProvider.addProductToCart(
                                          widget.productId,
                                          cartAttr.price,
                                          cartAttr.title,
                                          cartAttr.imageUrl,
                                          cartAttr.offer);
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: Icon(
                                        Icons.add,
                                        color: Colors.green,
                                        size: 22,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Flexible(
                          flex: 1,
                          child: Column(
                            children: [
                              showproducDetail(
                                  '  ${subTotal.toStringAsFixed(2)}  '),
                              Text(
                                '%${cartAttr.offer.toString()}خصم',
                                style: TextStyle(color: Colors.green[700]),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 8),
              child: Container(
                width: 100,
                height: 120,
                decoration: BoxDecoration(
                  color: Colors.grey[350],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.network(
                    cartAttr.imageUrl,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
