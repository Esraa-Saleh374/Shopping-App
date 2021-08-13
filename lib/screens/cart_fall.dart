import 'package:dotted_line/dotted_line.dart';
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

    Widget detailCart(IconData icon, String text) {
      return Expanded(
        flex: 2,
        child: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Column(
            children: [
              InkWell(
                onTap: () {},
                child: Container(
                    width: 70,
                    height: 70,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.grey,
                    ),
                    child: Icon(
                      icon,
                      size: 30,
                    )),
              ),
              SizedBox(
                height: 4,
              ),
              Center(child: Text(text)),
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

    final cartAttr = Provider.of<CartAttr>(context);
    final cartProvider = Provider.of<CartProvider>(context);
    double subTotal = cartAttr.price * cartAttr.quantity;
    return InkWell(
      onTap: () => Navigator.pushNamed(context, FeedsProductDetails.routeName,
          arguments: widget.productId),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 8, left: 8, bottom: 10),
            child: Container(
              width: double.infinity,
              height: 118,
              child: Row(
                children: [
                  detailCart(Icons.payment, 'تفاصيل الدفع '),
                  dashLine(),
                  detailCart(Icons.location_on, "تفاصيل الشحن "),
                  dashLine(),
                  detailCart(Icons.details_outlined, "تفاصيل الطلب "),
                ],
              ),
            ),
          ),
          Content(
              cartAttr.title,
              cartAttr.quantity,
              '  ${subTotal.toStringAsFixed(2)}  ',
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
                            width: MediaQuery.of(context).size.width * 0.1,
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
              '%${cartAttr.offer.toString()}خصم',
              cartAttr.imageUrl),
        ],
      ),
    );
  }
}
