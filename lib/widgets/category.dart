import 'package:shopping/screens/categor_feed.dart';
import 'package:flutter/material.dart';

class Catogry extends StatefulWidget {
  final int index;

  Catogry({required this.index});

  @override
  _CatogryState createState() => _CatogryState();
}

class _CatogryState extends State<Catogry> {
  List<Map<String, Object>> categores = [
    {
      "categoryName": "phones",
      "categoryImages":
          "https://www.tech-mag.net/wp-content/uploads/2019/12/Best-Phones-For-2019-Medium.jpg",
    },
    {
      "categoryName": "Clothes",
      "categoryImages":
          "https://media.istockphoto.com/photos/fashionable-clothes-in-a-boutique-store-in-london-picture-id653003428?k=6&m=653003428&s=612x612&w=0&h=tkp1DBvqMpF-0qnOJR4Mjgdqr1LsDNGJ5wwbR8mb904=",
    },
    {
      "categoryName": "Shoes",
      "categoryImages":
          "https://i0.wp.com/post.healthline.com/wp-content/uploads/2021/05/987525-The-8-Best-Hoka-Shoes-for-Runners-1296x728-Header-e0edef.jpg?w=1155&h=1528",
    },
    {
      "categoryName": "Laptops",
      "categoryImages":
          "https://www.lenovo.com/medias/lenovo-laptop-yoga-slim-series-feature-2.jpg?context=bWFzdGVyfHJvb3R8NTgwNjg2fGltYWdlL2pwZ3xoMGMvaDg2LzExMDI4NzQxMTI4MjIyLmpwZ3xlNTgwYWQ2MDgwNzgyYWEzNThjYjAzYWE3MDZlMWY4OTZhNmM2NzRlZTI2Mjg3OTk2NDVmNmFmZGVkYmI5MDEx",
    },
    {
      "categoryName": "Furnitures",
      "categoryImages":
          "https://ak1.ostkcdn.com/wp-content/uploads/2017/09/Types-of-Furniture-for-Your-Home-hero.jpg",
    },
    {
      "categoryName": "Watches",
      "categoryImages":
          "https://www.iwc.com/content/dam/homepage/ww-2021/IW503605_tile_1.717.jpg.transform.article_image_335_2x.jpeg",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        InkWell(
          onTap: () {
            Navigator.of(context).pushNamed(CategoryFeedCsreens.routeName,
                arguments: "${categores[widget.index]["categoryName"]}");
            //  print("${categores[widget.index]["categoryName"]}");
          },
          child: Container(
            width: 150,
            height: 150,
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: NetworkImage(
                    categores[widget.index]["categoryImages"] as String),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Positioned(
          left: 10,
          right: 10,
          bottom: 0,
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            color: Theme.of(context).backgroundColor,
            child: Text(
              categores[widget.index]["categoryName"] as String,
              style: TextStyle(
                color: Theme.of(context).textSelectionTheme.selectionColor,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        )
      ],
    );
  }
}
