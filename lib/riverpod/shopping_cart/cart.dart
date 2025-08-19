import 'package:flutter_state_manage_sample/riverpod/shopping_cart/product.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'cart.g.dart';

@JsonSerializable()
class Cart {
  final List<Product> products;

  Cart({required this.products});

  double get subTotal =>
      products.fold(0, (sum, product) => sum + product.price);

  Cart copyWith({List<Product>? products}) {
    return Cart(products: products ?? this.products);
  }
}

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