import 'package:flutter/cupertino.dart';

class Product with ChangeNotifier {
  final String id;
  final String title;
  final String description;
  final double price;
  final String imageUrl;
  final String productCategoryName;
  final String brand;
  final int quantity;
  final bool isFavorite;
  final bool isPopular;
  final String offer;
  final double weight;
  final double volum;
  final String country;

  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.imageUrl,
    required this.productCategoryName,
    required this.brand,
    required this.quantity,
    required this.isFavorite,
    required this.isPopular,
    required this.offer,
    required this.weight,
    required this.volum,
    required this.country,
  });
}
