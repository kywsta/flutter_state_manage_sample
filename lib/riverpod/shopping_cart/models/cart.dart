import 'package:flutter_state_manage_sample/riverpod/shopping_cart/models/product.dart';
import 'package:json_annotation/json_annotation.dart';

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
