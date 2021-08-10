import 'package:flutter/material.dart';
import 'package:shopping/providers/cart_provider.dart';
import 'package:shopping/providers/favorite_provider.dart';
import 'package:shopping/providers/products_provider.dart';
import 'package:shopping/screens/feeds_product_details.dart';

import 'package:provider/provider.dart';

class FeedDialog extends StatelessWidget {
  final String serviceId;
  const FeedDialog({
    required this.serviceId,
  });
  Widget buildColumn(String text, IconData icon, Function tap) {
    return Column(
      children: [
        Container(
          child: Column(
            children: [
              CircleAvatar(
                radius: 25,
                backgroundColor: Colors.grey.withOpacity(.4),
                child: InkWell(
                  onTap: tap(),
                  child: Icon(
                    icon,
                    color: Colors.black,
                    size: 30,
                  ),
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Text(text),
            ],
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final favProv = Provider.of<FavoritProvider>(context);
    final bookProv = Provider.of<CartProvider>(context);
    final productProvider = Provider.of<Products>(context);
    final findserviceId = productProvider.findbyId(serviceId);

    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              constraints: BoxConstraints(
                  minHeight: 100,
                  maxHeight: MediaQuery.of(context).size.height * 0.3),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor,
              ),
              child: Image.network(
                findserviceId.imageUrl,
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 25, bottom: 30),
              color: Theme.of(context).scaffoldBackgroundColor,
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Container(
                          child: Column(
                            children: [
                              CircleAvatar(
                                radius: 25,
                                backgroundColor: Colors.grey.withOpacity(.4),
                                child: InkWell(
                                  onTap: () {
                                    favProv.addTofav(
                                        serviceId,
                                        findserviceId.price,
                                        findserviceId.title,
                                        findserviceId.imageUrl);
                                  },
                                  child: Icon(
                                    favProv.getFavoritItem
                                            .containsKey(serviceId)
                                        ? (Icons.favorite)
                                        : Icons.favorite_border,
                                    color: favProv.getFavoritItem
                                            .containsKey(serviceId)
                                        ? Colors.red
                                        : Colors.black,
                                    size: 30,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Text(
                                favProv.getFavoritItem.containsKey(serviceId)
                                    ? "In Favorit "
                                    : " Favorit",
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Container(
                          child: Column(
                            children: [
                              CircleAvatar(
                                radius: 25,
                                backgroundColor: Colors.grey.withOpacity(.4),
                                child: InkWell(
                                  onTap: () {
                                    Navigator.of(context)
                                        .pushNamed(
                                          FeedsProductDetails.routeName,
                                          arguments: findserviceId.id,
                                        )
                                        .then((value) =>
                                            Navigator.canPop(context)
                                                ? Navigator.pop(context)
                                                : null);
                                  },
                                  child: Icon(
                                    Icons.remove_red_eye,
                                    color: Colors.black,
                                    size: 30,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Text("View Sevice"),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Container(
                          child: Column(
                            children: [
                              CircleAvatar(
                                radius: 25,
                                backgroundColor: Colors.grey.withOpacity(.4),
                                child: InkWell(
                                  onTap: () {
                                    bookProv.addProductToCart(
                                      serviceId,
                                      findserviceId.price,
                                      findserviceId.title,
                                      findserviceId.imageUrl,
                                      findserviceId.offer,
                                    );
                                  },
                                  child: Icon(
                                    Icons.bookmarks,
                                    color: bookProv.getCartItem
                                            .containsKey(serviceId)
                                        ? Colors.deepPurple
                                        : Colors.black,
                                    size: 30,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Text(
                                bookProv.getCartItem.containsKey(serviceId)
                                    ? "Is Booking"
                                    : "Add to Book ",
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              child:
                  /************close****************/
                  Container(
                margin: EdgeInsets.all(8),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.white, width: 1.3),
                    shape: BoxShape.circle),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(30),
                    splashColor: Colors.grey,
                    onTap: () => Navigator.canPop(context)
                        ? Navigator.pop(context)
                        : null,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(Icons.close, size: 28, color: Colors.white),
                    ),
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
