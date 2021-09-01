import 'package:shopping/models/product.dart';
import 'package:shopping/screens/feeds_product_details.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart';
import 'package:shopping/widgets/show_feed_dialog.dart';
import 'package:provider/provider.dart';

class FeedsProduct extends StatefulWidget {
  @override
  _FeedsProductState createState() => _FeedsProductState();
}

class _FeedsProductState extends State<FeedsProduct> {
  @override
  Widget build(BuildContext context) {
    final productAttripute = Provider.of<Product>(context);
    return Padding(
      padding: const EdgeInsets.only(left: 13, right: 13),
      child: InkWell(
        onTap: () {
          Navigator.of(context).pushNamed(
            FeedsProductDetails.routeName,
            arguments: productAttripute.id,
          );
        },
        child: Container(
          width: 250,
          height: MediaQuery.of(context).size.height * .54,
          decoration: BoxDecoration(
            color: Theme.of(context).backgroundColor,
          ),
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    width: double.infinity,
                    constraints: BoxConstraints(
                      maxHeight: MediaQuery.of(context).size.height * .2,
                      minHeight: 100,
                    ),
                    child: Image.network(productAttripute.imageUrl),
                  ),
                  Positioned(
                    right: 0,
                    child: Badge(
                      toAnimate: false,
                      shape: BadgeShape.square,
                      badgeColor: Colors.pink,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(8),
                      ),
                      badgeContent: Text(
                          "%${productAttripute.offer.toString()}",
                          style: TextStyle(color: Colors.white)),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 8,
              ),
              Container(
                padding: EdgeInsets.only(left: 5),
                margin: EdgeInsets.only(left: 5, bottom: 2, right: 3),
                height: MediaQuery.of(context).size.height * .15,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      productAttripute.title,
                      overflow: TextOverflow.ellipsis,
                      textDirection: TextDirection.rtl,
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      ("${productAttripute.price} us"),
                      textDirection: TextDirection.rtl,
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        InkWell(
                          child: Icon(
                            Icons.more_horiz,
                            color: Colors.grey,
                          ),
                          onTap: () {
                            showDialog(
                                context: context,
                                builder: (context) =>
                                    FeedDialog(serviceId: productAttripute.id));
                          },
                        ),
                        Text(
                          ("المزيد"),
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
