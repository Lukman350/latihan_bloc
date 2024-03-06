import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';

// Belajar Cubit
class CounterCubit extends Cubit<int> {
  CounterCubit({this.initialData = 0}) : super(initialData);

  int initialData;
  int? current;
  int? next;

  void tambahData() {
    emit(state + 1);
  }

  void kurangData() {
    emit(state - 1);
  }

  @override
  void onChange(Change<int> change) {
    super.onChange(change);

    current = change.currentState;
    next = change.nextState;
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    super.onError(error, stackTrace);
    print('Error: $error');
  }
}

class BelajarCubit extends StatelessWidget {
  BelajarCubit({super.key});

  final CounterCubit myCounter = CounterCubit();

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
            initialData: myCounter.initialData,
            stream: myCounter.stream,
            builder: (context, snapshot) {
              return Center(
                child: Text(
                  '${snapshot.data}',
                  style: const TextStyle(fontSize: 50),
                ),
              );
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
