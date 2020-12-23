
import 'package:flutter/material.dart';
import 'package:musicPlayer/components/AlbumArt.dart';
import 'package:musicPlayer/components/animated_play_button.dart';
import 'package:musicPlayer/providers/music_provider.dart';
import 'package:provider/provider.dart';

class Controller extends StatefulWidget {
  @override
  _ControllerState createState() => _ControllerState();
}

class _ControllerState extends State<Controller> {
  @override
  Widget build(BuildContext context) {
    final musicProvider = Provider.of<MusicProvider>(context);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        color: Color(0xff654062),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: 50,
            width: 50,
            child: AlbumArt(musicProvider.currentSong['song'].albumArtwork),
          ),
          SizedBox(
            width: 15,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 30,
                  child: Text(
                    musicProvider.currentSong['song'].title,
                    style: TextStyle(fontSize: 18),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Text(
                  musicProvider.currentSong['song'].artist,
                  style: TextStyle(),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          AnimatedPlayButton(),
        ],
      ),
    );
  }
}
