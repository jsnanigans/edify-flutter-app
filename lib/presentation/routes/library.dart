import 'package:edify/cubit/player_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Library extends StatelessWidget {
  Library({Key key, this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            BlocBuilder<PlayerCubit, PlayerState>(builder: (_, state) {
              if (state is PlayerPlaying) {
                return Text(
                  'Playing',
                  style: Theme.of(context).textTheme.headline4,
                );
              }
              if (state is PlayerPaused) {
                return Text(
                  'Paused',
                  style: Theme.of(context).textTheme.headline4,
                );
              }

              return Text(
                "Stopped",
                style: Theme.of(context).textTheme.headline4,
              );
            }),
          ],
        ),
      ),
    );
  }
}
