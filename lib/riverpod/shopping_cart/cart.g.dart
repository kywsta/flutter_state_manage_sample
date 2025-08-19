// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Cart _$CartFromJson(Map<String, dynamic> json) => Cart(
  products: (json['products'] as List<dynamic>)
      .map((e) => Product.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$CartToJson(Cart instance) => <String, dynamic>{
  'products': instance.products,
};

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$activeCartHash() => r'dd11ff05f0232a482175314b43f5734e7d8a6e6f';

/// See also [ActiveCart].
@ProviderFor(ActiveCart)
final activeCartProvider =
    AutoDisposeNotifierProvider<ActiveCart, Cart>.internal(
      ActiveCart.new,
      name: r'activeCartProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$activeCartHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$ActiveCart = AutoDisposeNotifier<Cart>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
