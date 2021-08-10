import 'package:flutter/material.dart';

class CartAttr with ChangeNotifier {
  final String id;
  final String title;
  final double price;
  final String imageUrl;
  final int quantity;
  final String offer;

  CartAttr({
    required this.id,
    required this.title,
    required this.price,
    required this.imageUrl,
    required this.quantity,
    required this.offer,
  });
}
