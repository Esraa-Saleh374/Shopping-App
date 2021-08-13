import 'package:flutter/material.dart';

class Catogry extends StatelessWidget {
  final Map category;

  Catogry({required this.category});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: 100,
      decoration: BoxDecoration(
          // image:
          //     DecorationImage(image: NetworkImage(category['categoryImages'])),
          borderRadius: BorderRadius.circular(15),
          color: Theme.of(context).primaryColor),
      child: Text(
        category["categoryName"],
        style: TextStyle(
          fontSize: 18,
          color: Colors.white,
          // fontWeight: FontWeight.w800,
        ),
      ),
    );
  }
}
