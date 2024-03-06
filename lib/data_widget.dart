import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/counter.dart';

class DataWidget extends StatelessWidget {
  const DataWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final Counter myCounter = BlocProvider.of<Counter>(context);

    return Container(
      color: Colors.red,
      height: 100,
      width: 200,
      child: Center(
        child: BlocBuilder(
          bloc: myCounter,
          builder: (context, state) {
            return Text(
              '$state',
              style: const TextStyle(fontSize: 50, color: Colors.white),
              textAlign: TextAlign.center,
            );
          },
        ),
      ),
    );
  }
}
