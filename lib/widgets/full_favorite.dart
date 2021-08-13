import 'package:flutter/material.dart';
import 'package:shopping/widgets/category/show_dialog.dart';
import 'package:shopping/models/favorite_atrribute.dart';
import 'package:shopping/providers/favorite_provider.dart';
import 'package:shopping/screens/feeds_product_details.dart';
import 'package:provider/provider.dart';

class FullFevorit extends StatefulWidget {
  final String productId;

  const FullFevorit({required this.productId});
  @override
  _FullFevoritState createState() => _FullFevoritState();
}

class _FullFevoritState extends State<FullFevorit> {
  @override
  Widget build(BuildContext context) {
    final favoritAtt = Provider.of<FavoritgAtrr>(context);
    final favProvider = Provider.of<FavoritProvider>(context);
    ShowDailog showDailog = ShowDailog();
    return InkWell(
      onTap: () {},
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * .17,
            margin: EdgeInsets.only(left: 25, bottom: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 0,
                  offset: Offset(1.5, 1.5), // changes position of shadow
                ),
              ],
            ),
            child: Material(
              color: Theme.of(context).backgroundColor,
              borderRadius: BorderRadius.circular(5),
              child: InkWell(
                onTap: () {
                  Navigator.pushNamed(context, FeedsProductDetails.routeName,
                      arguments: widget.productId);
                  print("object");
                },
                child: Container(
                  padding: EdgeInsets.all(15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Expanded(
                          child: Column(
                            children: [
                              Text(
                                favoritAtt.title,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  Text(
                                    "\$ ${favoritAtt.price}",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Text(
                                    ':السعر ',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        height: 80,
                        child: Image.network(
                          favoritAtt.imageUrl,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 25,
            left: 10,
            child: Container(
              height: 30,
              width: 30,
              child: MaterialButton(
                padding: EdgeInsets.only(right: 2),
                color: Colors.red,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                onPressed: () {
                  showDailog.showTheDialog(
                    "حذف كل العناصر ! ",
                    "سوف يتم حذف جميع العناصر لديك ",
                    () {
                      favProvider.removeitem(widget.productId);
                    },
                    context,
                  );
                },
                child: Icon(
                  Icons.clear,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
