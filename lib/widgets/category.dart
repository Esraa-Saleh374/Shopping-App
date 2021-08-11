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
      "categoryName": "موبيلات",
      "categoryImages":
          "https://www.tech-mag.net/wp-content/uploads/2019/12/Best-Phones-For-2019-Medium.jpg",
    },
    {
      "categoryName": "ملابس",
      "categoryImages":
          "https://media.istockphoto.com/photos/fashionable-clothes-in-a-boutique-store-in-london-picture-id653003428?k=6&m=653003428&s=612x612&w=0&h=tkp1DBvqMpF-0qnOJR4Mjgdqr1LsDNGJ5wwbR8mb904=",
    },
    {
      "categoryName": "احذيه",
      "categoryImages":
          "https://i0.wp.com/post.healthline.com/wp-content/uploads/2021/05/987525-The-8-Best-Hoka-Shoes-for-Runners-1296x728-Header-e0edef.jpg?w=1155&h=1528",
    },
    {
      "categoryName": "لاب توب",
      "categoryImages":
          "https://www.lenovo.com/medias/lenovo-laptop-yoga-slim-series-feature-2.jpg?context=bWFzdGVyfHJvb3R8NTgwNjg2fGltYWdlL2pwZ3xoMGMvaDg2LzExMDI4NzQxMTI4MjIyLmpwZ3xlNTgwYWQ2MDgwNzgyYWEzNThjYjAzYWE3MDZlMWY4OTZhNmM2NzRlZTI2Mjg3OTk2NDVmNmFmZGVkYmI5MDEx",
    },
    {
      "categoryName": "اثاث",
      "categoryImages":
          "https://ak1.ostkcdn.com/wp-content/uploads/2017/09/Types-of-Furniture-for-Your-Home-hero.jpg",
    },
    {
      "categoryName": "ساعات",
      "categoryImages":
          "https://www.iwc.com/content/dam/homepage/ww-2021/IW503605_tile_1.717.jpg.transform.article_image_335_2x.jpeg",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      //  color: Color.fromARGB(255, 120, 66, 150),
      padding: EdgeInsets.symmetric(horizontal: 2),
      child: Container(
        width: 80,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Center(
          child: Text(
            categores[widget.index]["categoryName"] as String,
            style: TextStyle(
              fontSize: 18,
              color: Colors.white,
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
      ),
    );
  }
}
