import 'package:edify/cubit/app_player_cubit.dart';
import 'package:edify/presentation/routes/library.dart';
import 'package:edify/presentation/widgets/player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final AppPlayerCubit appPlayerCubit = AppPlayerCubit();

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          brightness: Brightness.dark,
          primaryColor: Colors.redAccent,
          accentColor: Colors.pinkAccent,
          textTheme: GoogleFonts.abelTextTheme(
            ThemeData.dark().textTheme,
          ),
        ),
        home: Scaffold(
          body: BlocProvider.value(
            value: appPlayerCubit,
            child: Library(),
          ),
          bottomNavigationBar: BottomAppBar(
            shape: const CircularNotchedRectangle(),
            child: BlocProvider.value(value: appPlayerCubit, child: Player()),
          ),
          // floatingActionButton: ActionButton(),
          // floatingActionButtonLocation:
          //     FloatingActionButtonLocation.endDocked,
        ));
  }
}
