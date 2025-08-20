// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$productListHash() => r'6facb04c3880b546f99bea4f2c06a3b6aa024355';

/// See also [ProductList].
@ProviderFor(ProductList)
final productListProvider =
    AutoDisposeAsyncNotifierProvider<ProductList, List<Product>>.internal(
      ProductList.new,
      name: r'productListProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$productListHash,
      dependencies: <ProviderOrFamily>[productRepositoryProvider],
      allTransitiveDependencies: <ProviderOrFamily>{
        productRepositoryProvider,
        ...?productRepositoryProvider.allTransitiveDependencies,
      },
    );

typedef _$ProductList = AutoDisposeAsyncNotifier<List<Product>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
