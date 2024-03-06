import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:latihan_bloc/bloc/counter.dart';

import 'data_widget.dart';

class BelajarBlocProvider extends StatelessWidget {
  const BelajarBlocProvider({super.key});

  @override
  Widget build(BuildContext context) {
    final Counter myCounter = context.read<Counter>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Belajar BlocProvider'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Bloc Anonymous Route Access
          // Navigator.of(context).push(
          //   MaterialPageRoute(
          //     builder: (context) => BlocProvider.value(
          //       value: myCounter,
          //       child: const OtherPage(),
          //     ),
          //   ),
          // );

          // Bloc Named Route Access & Generate Route Access
          Navigator.of(context).pushNamed('/other_page');
        },
        child: const Icon(Icons.arrow_forward_ios_rounded),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Material(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(25),
                child: InkWell(
                  onTap: () {
                    myCounter.decrement();
                  },
                  borderRadius: BorderRadius.circular(25),
                  child: const SizedBox(
                    height: 100,
                    width: 70,
                    child: Center(
                      child: Icon(Icons.remove, color: Colors.white),
                    ),
                  ),
                ),
              ),
              const DataWidget(),
              Material(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(25),
                child: InkWell(
                  onTap: () {
                    myCounter.increment();
                  },
                  borderRadius: BorderRadius.circular(25),
                  child: const SizedBox(
                    height: 100,
                    width: 70,
                    child: Center(
                      child: Icon(Icons.add, color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
