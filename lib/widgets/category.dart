import 'package:flutter/material.dart';

class Catogry extends StatelessWidget {
  final Map category;

  Catogry({required this.category});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      decoration: BoxDecoration(
        // image:
        //     DecorationImage(image: NetworkImage(category['categoryImages'])),
        borderRadius: BorderRadius.circular(10),
        color: Theme.of(context).primaryColor,
      ),
      child: Center(
        child: Text(
          category["categoryName"],
          style: TextStyle(
            fontSize: 18,
            color: Colors.white,
            // fontWeight: FontWeight.w800,
          ),
        ),
      ),
    );
  }
}
