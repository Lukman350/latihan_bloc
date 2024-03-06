import 'package:flutter/material.dart';

import 'routes/routes.dart';

class MainAppBlocProvider extends StatelessWidget {
  MainAppBlocProvider({super.key});

  final routes = AppRoute();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: routes.onGenerateRoute,
    );
  }
}
