import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:latihan_bloc/bloc/counter.dart';

class BelajarBlocListener extends StatelessWidget {
  BelajarBlocListener({super.key});

  final Counter myCounter = Counter();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Belajar BlocListener'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BlocListener<Counter, int>(
            bloc: myCounter,
            listener: (context, state) {
              print(state);

              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Hello, even number!'),
                  duration: Duration(milliseconds: 500),
                ),
              );
            },
            listenWhen: (previous, current) {
              return current.isEven;
            },
            child: BlocBuilder<Counter, int>(
              bloc: myCounter,
              // buildWhen: (previous, current) {
              //   return current.isOdd;
              // },
              builder: (context, state) {
                return Text(
                  '$state',
                  style: const TextStyle(fontSize: 50),
                );
              },
            ),
          ),
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
