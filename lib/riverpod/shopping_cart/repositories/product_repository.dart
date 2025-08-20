import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_state_manage_sample/riverpod/shopping_cart/models/product.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:http/http.dart' as http;

part 'product_repository.g.dart';

abstract class ProductRepository {
  Future<List<Product>> loadProducts();
}

class ProductRepositoryImpl implements ProductRepository {
  @override
  Future<List<Product>> loadProducts() async {
    final response = await http.get(
      Uri.parse('https://fakestoreapi.com/products'),
    );
    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      return (body as List).map((e) => Product.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load products: ${response.statusCode}');
    }
  }
}

@Riverpod(dependencies: [])
ProductRepository productRepository(Ref ref) {
  return ProductRepositoryImpl();
}
