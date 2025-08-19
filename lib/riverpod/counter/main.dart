import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_state_manage_sample/riverpod/counter/counter.dart';

void main(List<String> args) {
  runApp(const ProviderScope(child: App()));
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: CounterPage());
  }
}

class CounterPage extends ConsumerWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Center(child: Text('Counter: ${ref.watch(counterProvider)}')),
      floatingActionButton: _buildCounterButtons(ref),
    );
  }

  Widget _buildCounterButtons(WidgetRef ref) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        FloatingActionButton(
          onPressed: () => _onIncrementPressed(ref),
          child: Icon(Icons.add),
        ),
        SizedBox(height: 8),
        FloatingActionButton(
          onPressed: () => _onDecrementPressed(ref),
          child: Icon(Icons.remove),
        ),
      ],
    );
  }

  void _onIncrementPressed(WidgetRef ref) {
    ref.read(counterProvider.notifier).state++;
  }

  void _onDecrementPressed(WidgetRef ref) {
    ref.read(counterProvider.notifier).state--;
  }
}
