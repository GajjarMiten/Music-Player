import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:musicPlayer/providers/audio_player.dart';
import 'package:provider/provider.dart';

class AnimatedPlayButton extends StatefulWidget {
  @override
  _AnimatedPlayButtonState createState() => _AnimatedPlayButtonState();
}

class _AnimatedPlayButtonState extends State<AnimatedPlayButton>
    with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;

  @override
  void initState() {
    controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 700));
    animation = CurvedAnimation(parent: controller, curve: Curves.linear);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final player = Provider.of<Player>(context);
    return StreamBuilder<AudioPlayerState>(
      stream: player.stateStream,
      initialData: AudioPlayerState.PAUSED,
      builder:
          (BuildContext context, AsyncSnapshot<AudioPlayerState> snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          var state = snapshot.data;

          if (state == AudioPlayerState.COMPLETED) {
            controller.forward();
          }

          if (state == AudioPlayerState.PLAYING) {
            controller.reverse();
          }

          if(state==AudioPlayerState.PAUSED){
            controller.forward();
          }

          return IconButton(
            icon: AnimatedIcon(
              icon: AnimatedIcons.pause_play,
              progress: animation,
            ),
            onPressed: () {
              if (state == AudioPlayerState.PAUSED) {
                player.resume();
                controller.reverse();
              } else if (state == AudioPlayerState.PLAYING) {
                controller.forward();
                player.pause();
              }
            },
          );
        }

        return IconButton(
          icon: Icon(Icons.play_arrow),
          onPressed: () {
            // player.play();
          },
        );
      },
    );
  }
}
