import 'package:flutter/material.dart';
import 'package:shopping/screens/favorit.dart';
import 'package:shopping/widgets/category.dart';
import 'package:shopping/widgets/category/appbar.dart';
import 'package:shopping/models/product_list.dart';
import 'package:shopping/providers/products_provider.dart';
import 'package:shopping/widgets/category/content_inside.dart';
import 'package:shopping/widgets/drawer_screen.dart';
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

  Widget iconAppBar(IconData icon, Function tap) {
    return InkWell(
      onTap: () => tap(),
      child: Icon(
        icon,
        color: Colors.yellow,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final serviceData = Provider.of<Products>(context);
    final productsList = serviceData.products;

    return Scaffold(
        body: ShowappBar(
      hight: 80,
      child: ListView(
        scrollDirection: Axis.vertical,
        children: [
          Stack(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 50),
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
                    textDirection: TextDirection.rtl,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          width: 0,
                          style: BorderStyle.none,
                        ),
                      ),
                      prefixIcon: Container(
                        height: 67,
                        width: 67,
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 120, 66, 150),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Icon(
                          Icons.notes_outlined,
                          color: Colors.yellow,
                          size: 40,
                        ),
                      ),
                      hintTextDirection: TextDirection.rtl,
                      hintText: '...اكتب كلمه البحث ',
                      filled: true,
                      fillColor: Theme.of(context).cardColor,
                      suffixIcon: Icon(
                        Icons.search,
                        color: Colors.grey,
                        size: 40,
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
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              SizedBox(
                height: 20,
              ),
              Container(
                width: double.infinity,
                height: 100,
                //  color: Colors.white,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  reverse: true,
                  itemCount: 6,
                  itemBuilder: (context, index) => Row(
                    textDirection: TextDirection.rtl,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Card(
                          color: Color.fromARGB(255, 120, 66, 150),
                          child: Catogry(
                            index: index,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      child: Text(
                        "نتائج البحث ",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        ),
                        textDirection: TextDirection.rtl,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      color: Color.fromARGB(255, 120, 66, 150),
                      width: 3,
                      height: 30,
                    ),
                  ],
                ),
              ),
              _searchTextController!.text.isNotEmpty && _searchList.isEmpty
                  // if you search an error prouduct
                  ? Center(
                      child: Text(
                        'عذرا ! هذا المنتج غير موجود ',
                        style: TextStyle(
                          color: Colors.grey[700],
                          fontSize: 30,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    )
                  // result of search here
                  : Content(
                      "serch",
                      90,
                      "99",
                      Padding(
                        padding: const EdgeInsets.only(right: 100),
                        child: Container(
                          //  padding: EdgeInsets.only(right: 50),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.orange,
                          ),
                          child: Icon(
                            Icons.add,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Text(""),
                      "offer",
                      "imageUrl")
            ],
          ),
        ],
      ),
    ));
  }
}
