import 'package:flutter/material.dart';

class FavoritgAtrr with ChangeNotifier {
  final String id;
  final String title;
  final double price;
  final String imageUrl;

  FavoritgAtrr({
    required this.id,
    required this.title,
    required this.price,
    required this.imageUrl,
  });
}
