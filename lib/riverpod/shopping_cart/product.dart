import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:http/http.dart' as http;

part 'product.g.dart';

@JsonSerializable()
class Product {
  final int id;
  final String title;
  final String description;
  final double price;
  final String category;
  final String image;

  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.category,
    required this.image,
  });

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);

  Map<String, dynamic> toJson() => _$ProductToJson(this);

  bool get isBudgetFriendly => price <= 100;
}


@riverpod
class ProductList extends _$ProductList {
  @override
  Future<List<Product>> build() async {
    final productRepository = ref.read(productRepositoryProvider);
    return await productRepository.loadProducts();
  }
}

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

@riverpod
ProductRepository productRepository(Ref ref) {
  return ProductRepositoryImpl();
}