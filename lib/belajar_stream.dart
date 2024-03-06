import 'package:flutter/material.dart';

// Belajar Stream
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
