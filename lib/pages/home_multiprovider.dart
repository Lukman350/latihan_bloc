import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:latihan_bloc/bloc/counter.dart';
import 'package:latihan_bloc/bloc/theme.dart';

class HomeMultiProvider extends StatelessWidget {
  const HomeMultiProvider({super.key});

  @override
  Widget build(BuildContext context) {
    final Counter counterBloc = context.read<Counter>();
    final ThemeBloc themeBloc = context.read<ThemeBloc>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Multi Provider'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => themeBloc.changeTheme(),
        child: BlocBuilder<ThemeBloc, bool>(
          bloc: themeBloc,
          builder: (context, state) {
            return Icon(state ? Icons.wb_sunny : Icons.brightness_3);
          },
        ),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            BlocBuilder<Counter, int>(
              builder: (context, state) {
                return Text(
                  '$state',
                  style: const TextStyle(
                    fontSize: 50,
                  ),
                );
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  onPressed: () => counterBloc.decrement(),
                  icon: const Icon(Icons.remove),
                ),
                IconButton(
                  onPressed: () => counterBloc.increment(),
                  icon: const Icon(Icons.add),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
