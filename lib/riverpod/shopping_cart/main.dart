import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_state_manage_sample/riverpod/shopping_cart/cart.dart';
import 'package:flutter_state_manage_sample/riverpod/shopping_cart/product.dart';

void main(List<String> args) {
  runApp(const ProviderScope(child: App()));
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: StorePage());
  }
}

class StorePage extends ConsumerWidget {
  const StorePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text('Store')),
      body: _buildProductList(ref),
      bottomSheet: _buildCart(ref),
    );
  }

  Widget _buildProductList(WidgetRef ref) {
    final productList = ref.watch(productListProvider);
    return productList.when(
      data: (productList) => ListView.builder(
        itemCount: productList.length,
        itemBuilder: (context, index) {
          return _buildProductItem(ref, productList[index]);
        },
      ),
      error: (error, stackTrace) => Text('Error: $error'),
      loading: () => const Center(child: CircularProgressIndicator()),
    );
  }

  Widget _buildProductItem(WidgetRef ref, Product product) {
    return ListTile(
      leading: AspectRatio(aspectRatio: 1, child: Image.network(product.image)),
      title: Text(product.title),
      subtitle: Text(product.price.toString()),
      trailing: IconButton(
        onPressed: () {
          ref.read(activeCartProvider.notifier).addProduct(product);
        },
        icon: const Icon(Icons.add_shopping_cart),
      ),
    );
  }

  Widget _buildCart(WidgetRef ref) {
    final cart = ref.watch(activeCartProvider);
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 8),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Expanded(
              child: Text(
                '${cart.products.length} Items',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
              child: Text(
                'Total: ${cart.subTotal}',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                ref.read(activeCartProvider.notifier).checkout();
              },
              child: const Text('Checkout'),
            ),
          ],
        ),
      ),
    );
  }
}
