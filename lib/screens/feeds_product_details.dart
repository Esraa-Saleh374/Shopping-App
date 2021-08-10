import 'package:shopping/providers/cart_provider.dart';
import 'package:shopping/providers/products_provider.dart';
import 'package:shopping/providers/darkmode_theme.dart';
import 'package:shopping/screens/cart.dart';
import 'package:shopping/screens/favorit.dart';
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

    return Scaffold(
      body: Stack(children: [
        Container(
          height: MediaQuery.of(context).size.height * .45,
          width: double.infinity,
          foregroundDecoration: BoxDecoration(color: Colors.black12),
          child: Padding(
            padding:
                const EdgeInsets.only(top: 85, left: 30, right: 30, bottom: 50),
            child: Image.network(findProId.imageUrl),
          ),
        ),
        SingleChildScrollView(
          padding: EdgeInsets.only(
            top: 16,
            bottom: 20,
          ),
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 255,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Material(
                        color: Colors.transparent,
                        child: InkWell(
                          borderRadius: BorderRadius.circular(32),
                          child: Container(
                            width: 50,
                            height: 50,
                            child: Icon(
                              Icons.save,
                              color: Colors.white,
                              size: 22,
                            ),
                          ),
                          onTap: () {},
                        ),
                      ),
                      Material(
                        color: Colors.transparent,
                        child: InkWell(
                          borderRadius: BorderRadius.circular(32),
                          child: Container(
                            width: 50,
                            height: 50,
                            child: Icon(
                              Icons.share,
                              color: Colors.white,
                              size: 22,
                            ),
                          ),
                          onTap: () {},
                        ),
                      ),
                    ],
                  ),
                  Container(
                    color: Theme.of(context).scaffoldBackgroundColor,
                    child: Padding(
                      padding:
                          const EdgeInsets.only(top: 16, right: 16, left: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * .9,
                            child: Text(
                              findProId.title,
                              maxLines: 2,
                              style: TextStyle(
                                fontSize: 26,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            // height: 440,
                            child: Text(
                              "US \$ ${findProId.price}",
                              maxLines: 2,
                              style: TextStyle(
                                fontSize: 21,
                                color: prov.darkTheme
                                    ? Theme.of(context).disabledColor
                                    : Colors.grey[600],
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Divider(
                            color: Colors.grey,
                            height: 1,
                            thickness: 1,
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            findProId.description,
                            maxLines: 2,
                            style: TextStyle(
                              fontSize: 21,
                              color: prov.darkTheme
                                  ? Theme.of(context).disabledColor
                                  : Colors.grey[600],
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Divider(
                            color: Colors.grey,
                            height: 1,
                            thickness: 1,
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          details("Brand : ", findProId.brand, prov.darkTheme),
                          details("Quantity : ", findProId.quantity.toString(),
                              prov.darkTheme),
                          details("Category : ", findProId.productCategoryName,
                              prov.darkTheme),
                          details(
                              "Popularity : ",
                              findProId.isPopular
                                  ? "Popular"
                                  : "Is not Popular",
                              prov.darkTheme),
                          SizedBox(
                            height: 15,
                          ),
                          Divider(
                            color: Colors.grey,
                            height: 1,
                            thickness: 1,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                width: double.infinity,
                color: Theme.of(context).backgroundColor,
                child: Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "No reviews yet",
                      style: TextStyle(
                        fontSize: 21,
                        color:
                            Theme.of(context).textSelectionTheme.selectionColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Text(
                        "Be the first review !",
                        maxLines: 2,
                        style: TextStyle(
                          fontSize: 21,
                          color: prov.darkTheme
                              ? Theme.of(context).disabledColor
                              : Colors.grey[600],
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Divider(
                      color: Colors.grey,
                      height: 1,
                      thickness: 1,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  width: double.infinity,
                  child: Text(
                    "Suggested Products : ",
                    style: TextStyle(
                      fontSize: 21,
                      color:
                          Theme.of(context).textSelectionTheme.selectionColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              Container(
                //height: 340,
                height: MediaQuery.of(context).size.height * .43,
                width: double.infinity,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: prodList.length,
                    itemBuilder: (context, index) {
                      return ChangeNotifierProvider.value(
                          value: prodList[index], child: FeedsProduct());
                    }),
              ),
              SizedBox(
                height: 50,
              ),
            ],
          ),
        ),
        Positioned(
          top: 0,
          right: 0,
          left: 0,
          child: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            title: Text("Details ".toUpperCase()),
            actions: [
              IconButton(
                  icon: Icon(
                    Icons.favorite,
                    color: Colors.purpleAccent.withOpacity(.9),
                  ),
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => Fevorit()));
                  }),
              IconButton(
                  icon: Icon(
                    Icons.shopping_cart_sharp,
                    color: Colors.deepPurple,
                  ),
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => CartScreen()));
                  }),
            ],
          ),
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                flex: 3,
                child: Container(
                  height: 50,
                  child: RaisedButton(
                    color: Colors.redAccent.shade400,
                    onPressed: () {
                      cartProvider.addProductToCart(productId, findProId.price,
                          findProId.title, findProId.imageUrl, findProId.offer);
                    },
                    child: Text(
                      cartProvider.getCartItem.containsKey(productId)
                          ? "In Cart "
                          : " add to cart".toUpperCase(),
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  height: 50,
                  child: RaisedButton(
                    color: Theme.of(context).backgroundColor,
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "buy now".toUpperCase(),
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Icon(
                          Icons.payment,
                          size: 20,
                          color: Colors.green,
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  height: 50,
                  color: prov.darkTheme
                      ? Theme.of(context).disabledColor
                      : Colors.grey[600],
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.favorite,
                      color: Colors.white,
                    ),
                  ),
                ),
              )
            ],
          ),
        )
      ]),
    );
  }
}
