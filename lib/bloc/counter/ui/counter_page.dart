import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_state_manage_sample/bloc/counter/bloc/counter_bloc.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterBloc(),
      child: CounterView(),
    );

    // return MultiBlocProvider(
    //   providers: [
    //     BlocProvider(create: (context) => CounterBloc()),
    //     // ... some other bloc providers
    //   ],
    //   child: CounterView(),
    // );
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

  AppBar _buildAppBar() => AppBar(title: Text('Counter'));

  Widget _buildCounterText() {
    return Center(
      child: BlocBuilder<CounterBloc, CounterState>(
        builder: (context, state) {
          return Text(
            '${state.count}',
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
    context.read<CounterBloc>().add(CounterIncremented());
  }

  void _onDecrementPressed(BuildContext context) {
    context.read<CounterBloc>().add(CounterDecremented());
  }
}
