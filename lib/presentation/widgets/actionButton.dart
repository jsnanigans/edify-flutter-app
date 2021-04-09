import 'package:edify/cubit/app_player_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ActionButton extends StatelessWidget {
  ActionButton({Key? key, this.action}) : super(key: key);
  final VoidCallback? action;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppPlayerCubit, AppPlayerState>(builder: (_, state) {
      Icon icon = Icon(Icons.play_arrow_rounded);

      if (state is AppPlayerPlaying) {
        icon = Icon(Icons.pause);
      }

      return FloatingActionButton(
        tooltip: 'Play track', child: icon, onPressed: action);
    });
  }
}
