import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:latihan_bloc/bloc/counter.dart';
import 'package:latihan_bloc/material_app.dart';

import 'bloc/theme.dart';

class MainMultiProvider extends StatelessWidget {
  const MainMultiProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<Counter>(create: (context) => Counter()),
        BlocProvider<ThemeBloc>(create: (context) => ThemeBloc()),
      ],
      child: const App(),
    );

    // return BlocProvider(
    //   create: (context) => themeBloc,
    //   child: BlocBuilder<ThemeBloc, bool>(
    //     bloc: themeBloc,
    //     builder: (context, state) {
    //       return MaterialApp(
    //         theme: state ? ThemeData.dark() : ThemeData.light(),
    //         home: BlocProvider(
    //           create: (context) => Counter(),
    //           child: const HomeMultiProvider(),
    //         ),
    //       );
    //     },
    //   ),
    // );
  }
}
