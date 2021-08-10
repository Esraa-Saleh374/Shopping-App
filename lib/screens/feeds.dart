import 'package:shopping/models/product_list.dart';
import 'package:shopping/providers/products_provider.dart';
import 'package:shopping/widgets/feed_product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';

class Feeds extends StatelessWidget {
  static const routeName = '/feeds';

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<Products>(context);
    List<Product> prodlist = productProvider.products;
    final propopular = ModalRoute.of(context)!.settings.arguments as String;
    if (propopular == "popular") {
      prodlist = productProvider.populardProduct;
    }
    return Scaffold(
      body: StaggeredGridView.countBuilder(
        crossAxisCount: 6,
        itemCount: prodlist.length,
        itemBuilder: (BuildContext context, int index) =>
            ChangeNotifierProvider.value(
          value: prodlist[index],
          child: FeedsProduct(),
        ),
        staggeredTileBuilder: (int index) =>
            new StaggeredTile.count(3, index.isEven ? 4.5 : 5),
        mainAxisSpacing: 8.0,
        crossAxisSpacing: 6.0,
      ),
    );
  }
}
