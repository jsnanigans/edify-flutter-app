import 'package:edify/cubit/app_player_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Library extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Library"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            BlocBuilder<AppPlayerCubit, AppPlayerState>(builder: (_, state) {
              if (state is AppPlayerPlaying) {
                return Text(
                  'Playing',
                  style: Theme.of(context).textTheme.headline4,
                );
              }
              if (state is AppPlayerPaused) {
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
