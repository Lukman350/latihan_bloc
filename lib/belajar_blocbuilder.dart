import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:latihan_bloc/bloc/counter.dart';

class BelajarBlocBuilder extends StatelessWidget {
  BelajarBlocBuilder({super.key});

  final Counter myCounter = Counter();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Belajar BlocBuilder'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BlocBuilder<Counter, int>(
            bloc: myCounter,
            buildWhen: (previous, current) {
              return current.isOdd;
            },
            builder: (context, state) {
              return Text(
                '$state',
                style: const TextStyle(fontSize: 50),
              );
            },
          ),
          // StreamBuilder(
          //   initialData: myCounter.initialData,
          //   stream: myCounter.stream,
          //   builder: (context, snapshot) {
          //     return Text(
          //       '${snapshot.data}',
          //       style: const TextStyle(fontSize: 50),
          //     );
          //   },
          // ),
          const SizedBox(height: 50),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                onPressed: () => myCounter.decrement(),
                icon: const Icon(Icons.remove),
              ),
              IconButton(
                onPressed: () => myCounter.increment(),
                icon: const Icon(Icons.add),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
