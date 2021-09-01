import 'package:shopping/providers/cart_provider.dart';
import 'package:shopping/providers/products_provider.dart';
import 'package:shopping/providers/darkmode_theme.dart';
import 'package:shopping/screens/cart.dart';
import 'package:shopping/screens/favorit.dart';
import 'package:shopping/widgets/category/appbar.dart';
import 'package:shopping/widgets/feed_product.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FeedsProductDetails extends StatefulWidget {
  static const routeName = "/productDetails";
  @override
  _FeedsProductDetailsState createState() => _FeedsProductDetailsState();
}

class _FeedsProductDetailsState extends State<FeedsProductDetails> {
  Widget details(String text, String description, bool prov) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              text,
              textDirection: TextDirection.rtl,
              maxLines: 2,
              style: TextStyle(
                fontSize: 21,
                color: Theme.of(context).textSelectionTheme.selectionColor,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              description,
              maxLines: 2,
              style: TextStyle(
                fontSize: 20,
                color:
                    prov ? Theme.of(context).disabledColor : Colors.grey[600],
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 4,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<DarkThemeProvider>(context);
    final productProvider = Provider.of<Products>(context);
    final productId = ModalRoute.of(context)!.settings.arguments as String;
    print("Poduct ID is : $productId");
    final prodList = productProvider.products;
    final findProId = productProvider.findbyId(productId);
    final cartProvider = Provider.of<CartProvider>(context);
    double extraHeight = (MediaQuery.of(context).padding.top + kToolbarHeight);

    return Container(
      color: Colors.grey,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: RoundedAppBar(),
        //  AppBar(
        //   backgroundColor: Colors.transparent,
        //   elevation: 0,
        //   title: Text("Details ".toUpperCase()),
        //   actions: [
        //     IconButton(
        //         icon: Icon(
        //           Icons.favorite_border,
        //           color: Theme.of(context).accentColor,
        //         ),
        //         onPressed: () {
        //           Navigator.of(context)
        //               .push(MaterialPageRoute(builder: (context) => Fevorit()));
        //         }),
        //     IconButton(
        //         icon: Icon(
        //           Icons.shopping_cart_sharp,
        //           color: Colors.white,
        //         ),
        //         onPressed: () {
        //           Navigator.of(context).push(
        //               MaterialPageRoute(builder: (context) => CartScreen()));
        //         }),
        //   ],
        // ),
        body: Stack(children: [
          SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height - extraHeight,
              color: Theme.of(context).scaffoldBackgroundColor,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                // verticalDirection: VerticalDirection.up,
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    //  width: MediaQuery.of(context).size.width * .2,
                    child: Text(
                      " خصم  ${findProId.offer} %",
                      textDirection: TextDirection.rtl,
                      maxLines: 1,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.green,
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * .9,
                    child: Text(
                      findProId.title,
                      textDirection: TextDirection.rtl,
                      maxLines: 2,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    // height: 440,
                    child: Text(
                      "دينار ${findProId.price}",
                      textDirection: TextDirection.rtl,
                      style: TextStyle(
                        fontSize: 21,
                        color: Colors.purple,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Divider(
                    color: Colors.grey.shade300,
                    height: 1,
                    thickness: 1,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: double.infinity,
                    height: 100,
                    child: ListView.builder(
                        itemCount: 10,
                        reverse: true,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Container(
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      width: 60,
                                      height: 60,
                                      child: Image.network(
                                          "https://cdn.salla.sa/klMbdlr6EDRJmYllqmJ7WanDrjBycziEzKo6wg6X.png"),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Center(child: Text("توت")),
                              ],
                            ),
                          );
                        }),
                  ),
                  Divider(
                    color: Colors.grey.shade300,
                    height: 1,
                    thickness: 1,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 4, horizontal: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      textDirection: TextDirection.rtl,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          textDirection: TextDirection.rtl,
                          children: [
                            Text(
                              ":الوزن",
                              style: TextStyle(
                                color: Colors.grey[500],
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              "${findProId.weight.toString()}غرام",
                              textDirection: TextDirection.rtl,
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.green[900],
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          textDirection: TextDirection.rtl,
                          children: [
                            Text(
                              ":الحجم",
                              style: TextStyle(
                                color: Colors.grey[500],
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              "${findProId.volum.toString()}مل",
                              textDirection: TextDirection.rtl,
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.green[900],
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          textDirection: TextDirection.rtl,
                          children: [
                            Text(
                              ":المنشأ",
                              style: TextStyle(
                                color: Colors.grey[500],
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              "${findProId.country}",
                              textDirection: TextDirection.rtl,
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.green[900],
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Divider(
                    color: Colors.grey.shade300,
                    height: 1,
                    thickness: 1,
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Text(
                    findProId.description,
                    maxLines: 5,
                    textDirection: TextDirection.rtl,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black38,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black45),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: Icon(
                              Icons.favorite_outline,
                              color: Colors.black54,
                              size: 30,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Expanded(
                        flex: 4,
                        child: Container(
                          width: 200,
                          height: MediaQuery.of(context).size.height * 0.06,
                          child: TextButton(
                            style: ElevatedButton.styleFrom(
                              primary: Theme.of(context).accentColor,
                              onPrimary: Colors.black,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                ),
                              ),
                            ),
                            onPressed: () {
                              cartProvider.addProductToCart(
                                productId,
                                findProId.price,
                                findProId.title,
                                findProId.imageUrl,
                                findProId.offer,
                              );
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              textDirection: TextDirection.rtl,
                              children: [
                                Icon(
                                  Icons.shopping_cart_outlined,
                                  color: Colors.black,
                                  textDirection: TextDirection.rtl,
                                ),
                                Text(
                                  'اضافه للسله '.toUpperCase(),
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                ],
              ),
            ),
          ),

          Container(
            height: MediaQuery.of(context).size.height * .40 - kToolbarHeight,
            width: double.infinity,
            color: Colors.grey.shade300,
            foregroundDecoration: BoxDecoration(color: Colors.black12),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 30),
              child: Image.network(
                findProId.imageUrl,
                fit: BoxFit.contain,
              ),
            ),
          ),
          // Align(
          //   alignment: Alignment.bottomRight,
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.start,
          //     children: [
          //       Expanded(
          //         flex: 3,
          //         child: Container(
          //           height: 50,
          //           child: ElevatedButton(
          //             style: ElevatedButton.styleFrom(
          //                 primary: Colors.redAccent.shade400),
          //             onPressed: () {
          //               cartProvider.addProductToCart(productId, findProId.price,
          //                   findProId.title, findProId.imageUrl, findProId.offer);
          //             },
          //             child: Text(
          //               cartProvider.getCartItem.containsKey(productId)
          //                   ? "In Cart "
          //                   : " add to cart".toUpperCase(),
          //               style: TextStyle(
          //                 fontSize: 18,
          //                 color: Colors.white,
          //                 fontWeight: FontWeight.w600,
          //               ),
          //             ),
          //           ),
          //         ),
          //       ),
          //       // Expanded(
          //       //   flex: 2,
          //       //   child: Container(
          //       //     height: 50,
          //       //     child: ElevatedButton(
          //       //       style: ElevatedButton.styleFrom(
          //       //           primary: Theme.of(context).backgroundColor),
          //       //       onPressed: () {},
          //       //       child: Row(
          //       //         mainAxisAlignment: MainAxisAlignment.start,
          //       //         children: [
          //       //           Text(
          //       //             "buy now".toUpperCase(),
          //       //             style: TextStyle(
          //       //               fontSize: 14,
          //       //               color: Colors.black,
          //       //               fontWeight: FontWeight.w600,
          //       //             ),
          //       //           ),
          //       //           SizedBox(
          //       //             width: 5,
          //       //           ),
          //       //           Icon(
          //       //             Icons.payment,
          //       //             size: 20,
          //       //             color: Colors.green,
          //       //           )
          //       //         ],
          //       //       ),
          //       //     ),
          //       //   ),
          //       // ),
          //       // Expanded(
          //       //   flex: 1,
          //       //   child: Container(
          //       //     height: 50,
          //       //     color: prov.darkTheme
          //       //         ? Theme.of(context).disabledColor
          //       //         : Colors.grey[600],
          //       //     child: IconButton(
          //       //       onPressed: () {},
          //       //       icon: Icon(
          //       //         Icons.favorite,
          //       //         color: Colors.white,
          //       //       ),
          //       //     ),
          //       //   ),
          //       // )
          //     ],
          //   ),
          // )
        ]),
      ),
    );
  }
}
