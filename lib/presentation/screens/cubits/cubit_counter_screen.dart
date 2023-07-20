import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formas_app/presentation/blocs/counter_cubit/counter_cubit.dart';

class CubitCounterScreen extends StatelessWidget {
  static const name = "CubitCounter";
  const CubitCounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => CounterCubit(), child: const _CubitCounterView());
  }
}

class _CubitCounterView extends StatelessWidget {
  const _CubitCounterView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    //final counterState = context.watch<CounterCubit>().state;

    return Scaffold(
      appBar: AppBar(
        title: context.select((CounterCubit value) =>
            Text("Cubits Counter: ${value.state.transactionCount}")),
        //Text("Cubits Counter: ${counterState.transactionCount}"),
        actions: [
          IconButton(
              onPressed: () => {context.read<CounterCubit>().reset()},
              icon: const Icon(Icons.refresh_rounded))
        ],
      ),
      body: Center(child: BlocBuilder<CounterCubit, CounterState>(
        //buildWhen: (previous, current) => current.counter != previous.counter,
        builder: (context, state) {
          return Text("Counter Value: ${state.counter}");
        },
      )),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
              heroTag: 1,
              child: const Text("+3"),
              onPressed: () => {context.read<CounterCubit>().increaseBy(3)}),
          const SizedBox(
            height: 15,
          ),
          FloatingActionButton(
              heroTag: 2,
              child: const Text("+2"),
              onPressed: () => {context.read<CounterCubit>().increaseBy(2)}),
          const SizedBox(
            height: 15,
          ),
          FloatingActionButton(
              heroTag: 3,
              child: const Text("+1"),
              onPressed: () => {context.read<CounterCubit>().increaseBy(1)}),
        ],
      ),
    );
  }
}
