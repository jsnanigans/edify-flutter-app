import 'package:edify/cubit/app_player_cubit.dart';
import 'package:edify/presentation/widgets/actionButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Player extends StatefulWidget {
  @override
  _PlayerState createState() => _PlayerState();
}

class _PlayerState extends State<Player> {
  bool isPlaying = false;
  // final assetsAudioPlayer = AssetsAudioPlayer();

  Future initPlayer() async {
    // assetsAudioPlayer.open(
    //   Audio("assets/raven.mp3"),
    //   showNotification: true,
    // );
  }

  Future togglePlay(context) async {
    BlocProvider.of<AppPlayerCubit>(context).toggle();
    // if (isPlaying == false) {
    //   await initPlayer();
    // } else {
    //   setState(() {
    //     isPlaying = true;
    //   });
    //   assetsAudioPlayer.playOrPause();
    // }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppPlayerCubit, AppPlayerState>(
      builder: (context, state) {
        return Container(
            height: 80,
            child: Row(
              children: [
                Container(
                    padding: EdgeInsets.all(5),
                    child: Image(
                        image: AssetImage('assets/crooked_kingdom.jpg'),
                        height: 70)),
                Container(
                  padding: EdgeInsets.all(5),
                  child: Column(
                    children: [
                      SelectableText('Crooked Kingdom', style: TextStyle(fontSize: 20)),
                      Container(
                        height: 2,
                      ),
                      SelectableText('1h 55m left',
                          style: TextStyle(
                              fontSize: 14,
                              color: Colors.white.withOpacity(.8))),
                    ],
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                  ),
                ),
                ActionButton(action: () => togglePlay(context)),
              ],
            ));
      },
    );
  }
}
