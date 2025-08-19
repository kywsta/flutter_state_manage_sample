import 'package:flutter_state_manage_sample/riverpod/shopping_cart/models/product.dart';
import 'package:flutter_state_manage_sample/riverpod/shopping_cart/repositories/product_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'product_provider.g.dart';

@riverpod
class ProductList extends _$ProductList {
  @override
  Future<List<Product>> build() async {
    final productRepository = ref.read(productRepositoryProvider);
    return await productRepository.loadProducts();
  }
}