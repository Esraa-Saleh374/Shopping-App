import 'package:shopping/models/cart_attribute.dart';
import 'package:shopping/providers/cart_provider.dart';
import 'package:shopping/screens/feeds_product_details.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping/widgets/category/content_inside.dart';

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

    final cartAttr = Provider.of<CartAttr>(context);
    final cartProvider = Provider.of<CartProvider>(context);
    double subTotal = cartAttr.price * cartAttr.quantity;
    return InkWell(
      onTap: () => Navigator.pushNamed(context, FeedsProductDetails.routeName,
          arguments: widget.productId),
      child: Column(
        children: [
          Content(
              cartAttr.title,
              cartAttr.quantity,
              '${subTotal.toStringAsFixed(2)}',
              Container(
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    width: 1,
                    color: Colors.grey.shade400,
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Material(
                      color: Colors.transparent,
                      child: InkWell(
                        borderRadius: BorderRadius.circular(4.0),
                        onTap: cartAttr.quantity <= 1
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
                              color: cartAttr.quantity <= 1
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
                          width: MediaQuery.of(context).size.width * 0.1,
                          padding: const EdgeInsets.all(8.0),
                          decoration: BoxDecoration(),
                          child: Text(
                            cartAttr.quantity.toString(),
                            strutStyle: StrutStyle(forceStrutHeight: true),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
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
              Material(
                color: Colors.transparent,
                child: InkWell(
                  borderRadius: BorderRadius.circular(32.0),
                  onTap: () {
                    _showDialog("!حذف العنصر",
                        "هذا المنتج سوف يتم حذفه من عربيه التسوق", () {
                      cartProvider.removeitem(widget.productId);
                    });
                  },
                  child: Container(
                    child: Icon(
                      Icons.close,
                      color: Colors.grey.shade400,
                      size: 20,
                    ),
                  ),
                ),
              ),
              '%${cartAttr.offer.toString()} خصم',
              cartAttr.imageUrl),
        ],
      ),
    );
  }
}
