import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import './product.dart';

class Products with ChangeNotifier {
  List<Product> _items = [
    Product(
      id: 'p1',
      title: 'Horizon Zero Dawn',
      description: 'Mysticism meets mechanical engineering',
      price: 7.99,
      imageUrl:
          'https://cdn.mos.cms.futurecdn.net/3VhkMECjVZJ8csnLjc7csG-970-80.jpg.webp',
    ),
    Product(
      id: 'p2',
      title: 'Marvel' 's Spider-Man',
      description: 'Ol' ' web-head is back and full of surprises',
      price: 59.99,
      imageUrl:
          'https://cdn.mos.cms.futurecdn.net/ZJZ3Nfa6CPUaoUwfKTR3LA-970-80.jpg.webp',
    ),
    Product(
      id: 'p3',
      title: 'Marvel' '/s' 'Spider-Man: Miles Morales',
      description: 'Miles gets a superhero’s welcome',
      price: 69.99,
      imageUrl:
          'https://cdn.mos.cms.futurecdn.net/ra5BYYms8HFBQ8smzBkF4b-970-80.jpg.webp',
    ),
    Product(
      id: 'p4',
      title: 'Metal Gear Solid V: The Phantom Pain',
      description: 'The return of the Big Boss.',
      price: 35.99,
      imageUrl:
          'https://cdn.mos.cms.futurecdn.net/Cui4GqPSBHPZpLWigUnuGM-970-80.jpg.webp',
    ),
    Product(
      id: 'p5',
      title: 'Red Dead Redemption 3',
      description: 'An epic for the ages.',
      price: 54.99,
      imageUrl:
          'https://cdn.mos.cms.futurecdn.net/gDavJNbL5jzZpLDye5H2xP-970-80.jpg.webp',
    ),
    Product(
      id: 'p6',
      title: 'Apex legends',
      description: 'A legend in a Making',
      price: 14.99,
      imageUrl:
          'https://cdn.mos.cms.futurecdn.net/SVFuLMa7T5YCwaZGEPfmRR-970-80.jpg.webp',
    ),
    Product(
      id: 'p7',
      title: 'Assasin' '\s creed Odyssey',
      description: 'This is sparta',
      price: 59.99,
      imageUrl:
          'https://cdn.mos.cms.futurecdn.net/tHiXfzDp6CHtuomBAkRHjk-970-80.jpg.webp',
    ),
    Product(
      id: 'p8',
      title: 'Battlefields',
      description: 'for those who wants a Break from CoD',
      price: 9.99,
      imageUrl:
          'https://cdn.mos.cms.futurecdn.net/Xa8kHU5zhArPeKMhABWadP-970-80.jpg.webp',
    ),
    Product(
      id: 'p9',
      title: 'Blood bourne',
      description: 'let the hunt begin',
      price: 11.99,
      imageUrl:
          'https://cdn.mos.cms.futurecdn.net/hWuEDuG6Xdx89hFJuJEhGe-970-80.jpg.webp',
    ),
    Product(
      id: 'p10',
      title: 'call of duty - modern warfare 2019',
      description: 'stay frosty',
      price: 15.99,
      imageUrl:
          'https://cdn.mos.cms.futurecdn.net/RndRHVHHLPcFjCmy9iGCiV-970-80.jpg.webp',
    ),
    Product(
      id: 'p11',
      title: 'Dreams',
      description: 'Playground of Creativity',
      price: 5.99,
      imageUrl:
          'https://cdn.mos.cms.futurecdn.net/LmVaZHpZn4X6FhzmskxwL-970-80.jpg.webp',
    ),
    Product(
      id: 'p12',
      title: 'FIFA 20',
      description: 'THIS IS FOOTBALL',
      price: 55.99,
      imageUrl:
          'https://cdn.mos.cms.futurecdn.net/gDdCMr6fUU8ikhc2DLaGu7-970-80.jpg.webp',
    ),
    Product(
      id: 'p13',
      title: 'Final Fantasy 7',
      description: 'Old Favorite But Brand NEW',
      price: 45.99,
      imageUrl:
          'https://cdn.mos.cms.futurecdn.net/yjvd99ixYoQKhhCi3ASBiL-970-80.jpg.webp',
    ),
    Product(
      id: 'p14',
      title: 'Fortnite-Battle royal',
      description: 'All about the BATTLEBUS',
      price: 35.99,
      imageUrl:
          'https://cdn.mos.cms.futurecdn.net/XjpogWYQLXK3YoKug4aiHE-970-80.jpg.webp',
    ),
    Product(
      id: 'p15',
      title: 'God Of War',
      description: 'Kratos is great at raising hell, but can he raise a son?',
      price: 17.99,
      imageUrl:
          'https://cdn.mos.cms.futurecdn.net/YVijvhSu3kFM9roZJ7TVkj-970-80.jpg.webp',
    ),
    Product(
      id: 'p16',
      title: 'Grand Theft Auto V',
      description: 'Chaotic playground',
      price: 24.99,
      imageUrl:
          'https://cdn.mos.cms.futurecdn.net/g2eUmC9mie6Et6Aic4zHPF-970-80.jpg.webp',
    ),
  ];
  // var _showFavoritesOnly = false;

  List<Product> get items {
    // if (_showFavoritesOnly) {
    //   return _items.where((prodItem) => prodItem.isFavorite).toList();
    // }
    return [..._items];
  }

  List<Product> get favoriteItems {
    return _items.where((prodItem) => prodItem.isFavorite).toList();
  }

  Product findById(String id) {
    return _items.firstWhere((prod) => prod.id == id);
  }

  // void showFavoritesOnly() {
  //   _showFavoritesOnly = true;
  //   notifyListeners();
  // }

  // void showAll() {
  //   _showFavoritesOnly = false;
  //   notifyListeners();
  // }

  void addProduct(Product product) {
    const url = 'https://flutter-update.firebaseio.com/products.json';
    http
        .post(
      url,
      body: json.encode({
        'title': product.title,
        'description': product.description,
        'imageUrl': product.imageUrl,
        'price': product.price,
        'isFavorite': product.isFavorite,
      }),
    )
        .then((response) {
      final newProduct = Product(
        title: product.title,
        description: product.description,
        price: product.price,
        imageUrl: product.imageUrl,
        id: json.decode(response.body)['name'],
      );
      _items.add(newProduct);
      // _items.insert(0, newProduct); // at the start of the list
      notifyListeners();
    });
  }

  void updateProduct(String id, Product newProduct) {
    final prodIndex = _items.indexWhere((prod) => prod.id == id);
    if (prodIndex >= 0) {
      _items[prodIndex] = newProduct;
      notifyListeners();
    } else {
      print('...');
    }
  }

  void deleteProduct(String id) {
    _items.removeWhere((prod) => prod.id == id);
    notifyListeners();
  }
}
