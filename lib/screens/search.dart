import 'package:flutter/material.dart';
import 'package:shopping/widgets/category/appbar.dart';
import 'package:shopping/models/product_list.dart';
import 'package:shopping/providers/products_provider.dart';
import 'package:shopping/widgets/feed_product.dart';
import 'package:provider/provider.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  TextEditingController? _searchTextController;
  final FocusNode _node = FocusNode();
  void initState() {
    super.initState();
    _searchTextController = TextEditingController();
    _searchTextController!.addListener(() {
      setState(() {});
    });
  }

  List<Product> _searchList = [];

  @override
  Widget build(BuildContext context) {
    final serviceData = Provider.of<Products>(context);
    final productsList = serviceData.products;

    return Scaffold(
        body: ShowappBar(
      hight: 300,
      child: Column(
        children: [
          Stack(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 120),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        spreadRadius: 1,
                        blurRadius: 3,
                      ),
                    ],
                  ),
                  margin: EdgeInsets.symmetric(horizontal: 16),
                  child: TextField(
                    controller: _searchTextController,
                    minLines: 1,
                    focusNode: _node,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          width: 0,
                          style: BorderStyle.none,
                        ),
                      ),
                      prefixIcon: Icon(
                        Icons.search,
                      ),
                      hintText: 'Search',
                      filled: true,
                      fillColor: Theme.of(context).cardColor,
                      suffixIcon: IconButton(
                        onPressed: _searchTextController!.text.isEmpty
                            ? null
                            : () {
                                _searchTextController!.clear();
                                _node.unfocus();
                              },
                        icon: Icon(Icons.clear,
                            color: _searchTextController!.text.isNotEmpty
                                ? Colors.red
                                : Colors.grey),
                      ),
                    ),
                    onChanged: (value) {
                      _searchTextController!.text.toLowerCase();
                      setState(() {
                        _searchList = serviceData.searchQuery(value);
                      });
                    },
                  ),
                ),
              ),
            ],
          ),
          _searchTextController!.text.isNotEmpty && _searchList.isEmpty
              ? Column(
                  children: [
                    SizedBox(
                      height: 50,
                    ),
                    Icon(
                      Icons.search,
                      size: 60,
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Text(
                      'No results found',
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
                    ),
                  ],
                )
              : Expanded(
                  child: ListView(
                    scrollDirection: Axis.vertical,
                    children: [
                      GridView.count(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        crossAxisCount: 2,
                        childAspectRatio: 240 / 420,
                        crossAxisSpacing: 8,
                        mainAxisSpacing: 8,
                        children: List.generate(
                            _searchTextController!.text.isEmpty
                                ? productsList.length
                                : _searchList.length, (index) {
                          return ChangeNotifierProvider.value(
                            value: _searchTextController!.text.isEmpty
                                ? productsList[index]
                                : _searchList[index],
                            child: FeedsProduct(),
                          );
                        }),
                      ),
                    ],
                  ),
                ),
        ],
      ),
    ));
  }
}
