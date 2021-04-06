import 'package:edify/cubit/player_cubit.dart';
import 'package:edify/presentation/routes/library.dart';
import 'package:edify/presentation/widgets/player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final PlayerCubit playerCubit = PlayerCubit();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          brightness: Brightness.dark,
          primaryColor: Colors.redAccent,
          accentColor: Colors.pinkAccent,
        ),
        home: Scaffold(
          body: BlocProvider.value(
            value: playerCubit,
            child: Library(title: 'Flutter Demo Home Page'),
          ),
          bottomNavigationBar: BottomAppBar(
            shape: const CircularNotchedRectangle(),
            child: BlocProvider.value(value: playerCubit, child: Player()),
          ),
          // floatingActionButton: ActionButton(),
          // floatingActionButtonLocation:
          //     FloatingActionButtonLocation.endDocked,
        ));
  }
}
