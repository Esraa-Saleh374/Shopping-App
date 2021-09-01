import 'package:shopping/models/product.dart';
import 'package:flutter/material.dart';

class Products with ChangeNotifier {
  List<Product> _products = [
    Product(
      id: 'سامسونج',
      title: 'سامسونج S9',
      isFavorite: false,
      quantity: 0,
      description:
          ' هذا النص قابل للتغير ويمكن استبداله في اي وقت . هذا النص قابل للتغير ويمكن استبداله في اي وقت . هذا النص قابل للتغير ويمكن استبداله في اي وقت  ',
      price: 50,
      imageUrl:
          'https://images-na.ssl-images-amazon.com/images/I/81%2Bh9mpyQmL._AC_SL1500_.jpg',
      brand: 'Samsung',
      productCategoryName: 'موبيل',
      isPopular: false,
      offer: '20',
      weight: .80,
      volum: .980,
      country: "السعوديه",
    ),
    Product(
      id: 'Samsung Galaxy A10s',
      title: 'سامسونج A10s',
      isFavorite: false,
      quantity: 0,
      description:
          ' هذا النص قابل للتغير ويمكن استبداله في اي وقت . هذا النص قابل للتغير ويمكن استبداله في اي وقت . هذا النص قابل للتغير ويمكن استبداله في اي وقت  ',
      price: 50.99,
      imageUrl:
          'https://images-na.ssl-images-amazon.com/images/I/51ME-ADMjRL._AC_SL1000_.jpg',
      brand: 'Samsung ',
      productCategoryName: 'Phones',
      isPopular: false,
      offer: '20',
      weight: .200,
      volum: 2.60,
      country: "مصر",
    ),
    Product(
      id: 'Samsung Galaxy A51',
      title: 'سامسونج A51',
      isFavorite: false,
      quantity: 0,
      description:
          'Samsung Galaxy A51 (128GB, 4GB) 6.5", 48MP Quad Camera, Dual SIM GSM Unlocked A515F/DS- Global 4G LTE International Model - Prism Crush Blue.',
      price: 100,
      imageUrl:
          'https://images-na.ssl-images-amazon.com/images/I/61HFJwSDQ4L._AC_SL1000_.jpg',
      brand: 'Samsung',
      productCategoryName: 'Phones',
      isPopular: true,
      offer: '70',
      weight: 7.200,
      volum: 6.60,
      country: "مصر",
    ),
    Product(
      id: 'Huawei P40 Pro',
      title: 'Huawei P40 Pro',
      isFavorite: false,
      quantity: 0,
      description:
          'Huawei P40 Pro (5G) ELS-NX9 Dual/Hybrid-SIM 256GB (GSM Only | No CDMA) Factory Unlocked Smartphone (Silver Frost) - International Version',
      price: 900.99,
      imageUrl:
          'https://images-na.ssl-images-amazon.com/images/I/6186cnZIdoL._AC_SL1000_.jpg',
      brand: 'Huawei',
      productCategoryName: 'Phones',
      isPopular: true,
      offer: '30',
      weight: .200,
      volum: 2.60,
      country: "مصر",
    ),
    Product(
      id: 'iPhone 12 Pro',
      title: 'iPhone 12 Pro',
      isFavorite: false,
      quantity: 0,
      description:
          'New Apple iPhone 12 Pro (512GB, Gold) [Locked] + Carrier Subscription',
      price: 1100,
      imageUrl: 'https://m.media-amazon.com/images/I/71cSV-RTBSL.jpg',
      brand: 'Apple',
      productCategoryName: 'Phones',
      isPopular: true,
      offer: '10',
      weight: .200,
      volum: 2.60,
      country: "الكويت",
    ),
    Product(
      id: 'iPhone 12 Pro Max ',
      title: 'iPhone 12 Pro Max ',
      isFavorite: false,
      quantity: 0,
      description:
          'New Apple iPhone 12 Pro Max (128GB, Graphite) [Locked] + Carrier Subscription',
      price: 50.99,
      imageUrl: 'https://m.media-amazon.com/images/I/71XXJC7V8tL._FMwebp__.jpg',
      brand: 'Apple',
      productCategoryName: 'Phones',
      isPopular: false,
      offer: '20',
      weight: .200,
      volum: 2.60,
      country: "الكويت",
    ),
    Product(
      id: 'Hanes Mens ',
      title: 'Long Sleeve Beefy Henley Shirt',
      isFavorite: false,
      quantity: 0,
      description: 'Hanes Men\'s Long Sleeve Beefy Henley Shirt ',
      price: 22.30,
      imageUrl:
          'https://images-na.ssl-images-amazon.com/images/I/91YHIgoKb4L._AC_UX425_.jpg',
      brand: 'No brand',
      productCategoryName: 'Clothes',
      isPopular: true,
      offer: '20',
      weight: .200,
      volum: 2.60,
      country: "الكويت",
    ),
    Product(
      id: 'Weave Jogger',
      title: 'Weave Jogger',
      isFavorite: false,
      quantity: 0,
      description: 'Champion Mens Reverse Weave Jogger',
      price: 58.99,
      imageUrl:
          'https://m.media-amazon.com/images/I/71g7tHQt-sL._AC_UL320_.jpg',
      brand: 'H&M',
      productCategoryName: 'Clothes',
      isPopular: false,
      offer: '20',
      weight: .200,
      volum: 2.60,
      country: "الكويت",
    ),
    Product(
      id: 'Adeliber Dresses for Womens',
      title: 'Adeliber Dresses for Womens',
      isFavorite: false,
      quantity: 0,
      description:
          'Adeliber Dresses for Womens, Sexy Solid Sequined Stitching Shining Club Sheath Long Sleeved Mini Dress',
      price: 50.99,
      imageUrl:
          'https://images-na.ssl-images-amazon.com/images/I/7177o9jITiL._AC_UX466_.jpg',
      brand: 'H&M',
      productCategoryName: 'Clothes',
      isPopular: true,
      offer: '30',
      weight: .200,
      volum: 2.60,
      country: "الامارات",
    ),
    Product(
      id: 'Tanjun Sneakers',
      title: 'Tanjun Sneakers',
      isFavorite: false,
      quantity: 0,
      description:
          'NIKE Men\'s Tanjun Sneakers, Breathable Textile Uppers and Comfortable Lightweight Cushioning ',
      price: 191.89,
      imageUrl:
          'https://images-na.ssl-images-amazon.com/images/I/71KVPm5KJdL._AC_UX500_.jpg',
      brand: 'Nike',
      productCategoryName: 'Shoes',
      isPopular: false,
      offer: '20',
      weight: .200,
      volum: 2.60,
      country: "الكويت",
    ),
    Product(
      id: 'choose Sneakers',
      title: 'choose Sneakers',
      isFavorite: false,
      quantity: 0,
      description:
          'NIKE Men\'s Tanjun Sneakers, Breathable Textile Uppers and Comfortable Lightweight Cushioning , NIKE Men\'s Tanjun Sneakers, Breathable Textile Uppers and Comfortable Lightweight Cushioning ',
      price: 391.89,
      imageUrl:
          'https://imcut.jollychic.com//uploads/jollyimg/imageLibrary/201903/8SV/03/IL201903032021362101.jpg',
      brand: 'H&M',
      productCategoryName: 'Shoes',
      isPopular: true,
      offer: '20',
      weight: .200,
      volum: 2.60,
      country: "الكويت",
    ),
  ];

  List<Product> get products {
    return _products;
  }

  List<Product> findbyCategory(String categoryName) {
    List<Product> _categoryList = _products
        .where((element) => element.productCategoryName
            .toLowerCase()
            .contains(categoryName.toLowerCase()))
        .toList();
    return _categoryList;
  }

  List<Product> findbybrand(String brandName) {
    List<Product> _categoryList = _products
        .where((element) =>
            element.brand.toLowerCase().contains(brandName.toLowerCase()))
        .toList();
    return _categoryList;
  }

  List<Product> get populardProduct {
    return _products.where((element) => element.isPopular).toList();
  }

  Product findbyId(String productId) {
    return _products.firstWhere((element) => element.id == productId);
  }

  List<Product> searchQuery(String searchtext) {
    List<Product> _serachList = _products
        .where((element) =>
            element.title.toLowerCase().contains(searchtext.toLowerCase()))
        .toList();
    return _serachList;
  }
}
