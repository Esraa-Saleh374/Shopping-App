import 'package:shopping/models/product.dart';
import 'package:shopping/providers/cart_provider.dart';
import 'package:shopping/screens/feeds_product_details.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PopularProduct extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<Product>(context);
    final cartProvider = Provider.of<CartProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 250,
        decoration: BoxDecoration(
            color: Theme.of(context).backgroundColor,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10),
            )),
        child: InkWell(
          onTap: () {
            // Navigator.of(context).push(
            //     MaterialPageRoute(builder: (context) => FeedsProductDetails()));
            Navigator.of(context).pushNamed(FeedsProductDetails.routeName,
                arguments: productData.id);
          },
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(10),
            bottomRight: Radius.circular(10),
          ),
          child: Column(
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(2),
                    child: Container(
                      width: double.infinity,
                      constraints: BoxConstraints(
                        maxHeight: MediaQuery.of(context).size.height * .3,
                        minHeight: 100,
                      ),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(productData.imageUrl),
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    right: 10,
                    top: 12,
                    child: Icon(
                      Icons.star_border,
                      color: Colors.grey.shade800,
                    ),
                  ),
                  Positioned(
                    right: 1,
                    bottom: 32,
                    child: Card(
                      elevation: 2,
                      child: Container(
                        padding: EdgeInsets.all(10),
                        color: Theme.of(context).backgroundColor,
                        child: Text(
                          "\$ ${productData.price}",
                          style: TextStyle(
                            color: Theme.of(context)
                                .textSelectionTheme
                                .selectionColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.all(8),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        productData.title,
                        maxLines: 1,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Row(
                        children: [
                          Expanded(
                            flex: 7,
                            child: Text(
                              productData.description,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: Colors.grey[800],
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Material(
                              color: Colors.transparent,
                              child: InkWell(
                                  borderRadius: BorderRadius.circular(32),
                                  child: Container(
                                    width: 50,
                                    height: 50,
                                    child: Icon(
                                      cartProvider.getCartItem
                                              .containsKey(productData.id)
                                          ? Icons.check
                                          : Icons.shopping_cart_sharp,
                                      color: cartProvider.getCartItem
                                              .containsKey(productData.id)
                                          ? Colors.red
                                          : Colors.black45,
                                      size: 22,
                                    ),
                                  ),
                                  onTap: cartProvider.getCartItem
                                          .containsKey(productData.id)
                                      ? () {}
                                      : () {
                                          cartProvider.addProductToCart(
                                            productData.id,
                                            productData.price,
                                            productData.title,
                                            productData.imageUrl,
                                            productData.offer,
                                          );
                                        }),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
