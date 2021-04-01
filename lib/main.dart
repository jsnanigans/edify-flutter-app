import 'package:edify/routes/library.dart';
import 'package:edify/widgets/actionButton.dart';
import 'package:edify/widgets/player.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
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
          body: Library(title: 'Flutter Demo Home Page'),
          bottomNavigationBar: BottomAppBar(
            shape: const CircularNotchedRectangle(),
            child: Player(),
          ),
          // floatingActionButton: ActionButton(),
          // floatingActionButtonLocation:
          //     FloatingActionButtonLocation.endDocked,
        ));
  }
}
