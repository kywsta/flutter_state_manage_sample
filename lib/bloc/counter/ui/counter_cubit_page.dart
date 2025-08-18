import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_state_manage_sample/bloc/counter/cubit/counter_cubit.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: CounterCubitPage());
  }
}

class CounterCubitPage extends StatelessWidget {
  const CounterCubitPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterCubit(),
      child: CounterView(),
    );
  }
}

class CounterView extends StatelessWidget {
  const CounterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildCounterText(),
      floatingActionButton: _buildCounterButtons(context),
    );
  }

  AppBar _buildAppBar() => AppBar(title: Text('Counter Cubit'));

  Widget _buildCounterText() {
    return Center(
      child: BlocBuilder<CounterCubit, int>(
        builder: (context, state) {
          return Text(
            '$state',
            style: Theme.of(context).textTheme.headlineMedium,
          );
        },
      ),
    );
  }

  Widget _buildCounterButtons(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        FloatingActionButton(
          onPressed: () => _onIncrementPressed(context),
          child: Icon(Icons.add),
        ),
        SizedBox(height: 8),
        FloatingActionButton(
          onPressed: () => _onDecrementPressed(context),
          child: Icon(Icons.remove),
        ),
      ],
    );
  }

  void _onIncrementPressed(BuildContext context) {
    context.read<CounterCubit>().increment();
  }

  void _onDecrementPressed(BuildContext context) {
    context.read<CounterCubit>().decrement();
  }
}
