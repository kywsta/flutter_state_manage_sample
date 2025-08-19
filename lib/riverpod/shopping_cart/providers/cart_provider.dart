import 'package:flutter_state_manage_sample/riverpod/shopping_cart/models/cart.dart';
import 'package:flutter_state_manage_sample/riverpod/shopping_cart/models/product.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'cart_provider.g.dart';

@riverpod
class ActiveCart extends _$ActiveCart {

  @override
  Cart build() {
    return Cart(products: []);
  }

  void addProduct(Product product) {
    state = state.copyWith(products: [...state.products, product]);
  }

  void removeProduct(Product product) {
    state = state.copyWith(products: state.products.where((p) => p.id != product.id).toList());
  }

  void checkout() {
    state = state.copyWith(products: []);
  }
}