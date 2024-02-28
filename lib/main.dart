import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BelajarCubit(),
    );
  }
}

class CounterCubit extends Cubit<int> {
  CounterCubit({this.initialData = 0}) : super(initialData);

  int initialData;

  void tambahData() {
    emit(state + 1);
  }

  void kurangData() {
    emit(state - 1);
  }
}

class BelajarCubit extends StatelessWidget {
  CounterCubit myCounter = CounterCubit(initialData: 99);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Belajar Cubit'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          StreamBuilder(
            stream: myCounter.stream,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return Center(
                  child: Text(
                    '${snapshot.data}',
                    style: const TextStyle(fontSize: 50),
                  ),
                );
              }
            },
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                onPressed: () => myCounter.kurangData(),
                icon: const Icon(
                  Icons.remove,
                ),
              ),
              IconButton(
                  onPressed: () => myCounter.tambahData(),
                  icon: const Icon(Icons.add))
            ],
          )
        ],
      ),
    );
  }
}

class BelajarStream extends StatelessWidget {
  const BelajarStream({super.key});

  Stream<int> streamData() async* {
    for (var i = 1; i <= 10; i++) {
      await Future.delayed(const Duration(seconds: 1));
      yield i;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Belajar Stream'),
      ),
      body: StreamBuilder(
        stream: streamData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return Center(
              child: Text(
                '${snapshot.data}',
                style: const TextStyle(fontSize: 50),
              ),
            );
          }
        },
      ),
    );
  }
}
