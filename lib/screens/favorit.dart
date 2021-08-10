import 'package:flutter/material.dart';
import 'package:shopping/widgets/category/show_dialog.dart';
import 'package:shopping/providers/favorite_provider.dart';
import 'package:shopping/widgets/empty_fevorit.dart';
import 'package:shopping/widgets/full_favorite.dart';
import 'package:provider/provider.dart';

class Fevorit extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final favProvider = Provider.of<FavoritProvider>(context);
    ShowDailog showDailog = ShowDailog();
    return Scaffold(
      body: favProvider.getFavoritItem.isEmpty
          ? Scaffold(body: EmptyFevorit())
          : Scaffold(
              appBar: AppBar(
                title: Text("المفضله (${favProvider.getFavoritItem.length})"),
                actions: [
                  IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      showDailog.showTheDialog(
                          " حذف الكل؟ ", "  كل العناصر سوف يتم حذفها ", () {
                        favProvider.clearFav();
                      }, context);
                    },
                  )
                ],
              ),
              body: ListView.builder(
                itemCount: favProvider.getFavoritItem.length,
                itemBuilder: (context, index) => ChangeNotifierProvider.value(
                  value: favProvider.getFavoritItem.values.toList()[index],
                  child: FullFevorit(
                    productId: favProvider.getFavoritItem.keys.toList()[index],
                  ),
                ),
              ),
            ),
    );
  }
}
