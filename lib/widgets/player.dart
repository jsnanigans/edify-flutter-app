import 'dart:io';

import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:edify/widgets/actionButton.dart';
import 'package:flutter/material.dart';

class Player extends StatefulWidget {
  @override
  _PlayerState createState() => _PlayerState();
}

class _PlayerState extends State<Player> {
  bool isPlaying = false;
  final assetsAudioPlayer = AssetsAudioPlayer();

  Future initPlayer() async {
    assetsAudioPlayer.open(
      Audio("assets/raven.mp3"),
      showNotification: true,
    );
  }

  Future togglePlay() async {
    if (isPlaying == false) {
      await initPlayer();
    } else {
      setState(() {
        isPlaying = true;
      });
      assetsAudioPlayer.playOrPause();
    }
  }

  @override
  Widget build(BuildContext context) {
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
                  Text('Crooked Kingdom', style: TextStyle(fontSize: 20)),
                  Container(
                    height: 2,
                  ),
                  Text('1h 55m left',
                      style: TextStyle(
                          fontSize: 14, color: Colors.white.withOpacity(.8))),
                ],
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
              ),
            ),
            ActionButton(action: togglePlay),
          ],
        ));
  }
}
