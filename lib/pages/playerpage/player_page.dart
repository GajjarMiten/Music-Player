import 'package:flutter/material.dart';
import 'package:flutter_audio_query/flutter_audio_query.dart';
import 'package:musicPlayer/components/AlbumArt.dart';
import 'package:musicPlayer/components/animated_play_button.dart';
import 'package:musicPlayer/providers/audio_player.dart';
import 'package:musicPlayer/providers/music_provider.dart';
import 'package:provider/provider.dart';

class PlayerPage extends StatefulWidget {
  @override
  _PlayerPageState createState() => _PlayerPageState();
}

class _PlayerPageState extends State<PlayerPage> {
  @override
  Widget build(BuildContext context) {
    final musicProvider = Provider.of<MusicProvider>(context);
    final player = Provider.of<Player>(context);
    return Material(
      color: Theme.of(context).primaryColor,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 20,
              child: Text(
                musicProvider.currentSong['song'].title,
                style: TextStyle(fontSize: 18),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(musicProvider.currentSong['song'].artist),
            SizedBox(
              height: 30,
            ),
            Container(
              height: 200,
              width: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.white,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: AlbumArt(musicProvider.currentSong['song'].albumArtwork),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            StreamBuilder(
              stream: player.durationStream,
              initialData: Duration(seconds: 0),
              builder: (context, AsyncSnapshot<Duration> snapshot) {
                if (snapshot.connectionState == ConnectionState.active) {
                  print(snapshot.data);
                  return Slider(
                    min: 0,
                    max: double.parse(
                        musicProvider.currentSong['song'].duration),
                    value: snapshot.data.inMilliseconds.toDouble(),
                    activeColor: Theme.of(context).accentColor,
                    onChanged: (value) {},
                  );
                } else {
                  return Slider(
                    min: 0,
                    max: double.parse(
                        musicProvider.currentSong['song'].duration),
                    value: 0,
                    activeColor: Theme.of(context).accentColor,
                    onChanged: (value) {},
                  );
                }
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(icon: Icon(Icons.repeat_rounded), onPressed: () {}),
                IconButton(
                  icon: Icon(Icons.fast_rewind_rounded),
                  onPressed: () {
                    int previousIndex = musicProvider.currentSong['index'] - 1;
                    if (previousIndex < 0) {
                      previousIndex =
                          musicProvider.musics.length + previousIndex + 1;
                    }
                    SongInfo previousSong = musicProvider.musics[previousIndex];

                    player.play(previousSong.filePath);

                    musicProvider.setCurrentSong(previousIndex, previousSong);
                  },
                ),
                AnimatedPlayButton(),
                IconButton(
                  icon: Icon(Icons.fast_forward_rounded),
                  onPressed: () {
                    int nextIndex = musicProvider.currentSong['index'] + 1;

                    nextIndex %= musicProvider.musics.length;

                    SongInfo nextSong = musicProvider.musics[nextIndex];

                    player.play(nextSong.filePath);

                    musicProvider.setCurrentSong(nextIndex, nextSong);
                  },
                ),
                IconButton(icon: Icon(Icons.shuffle_rounded), onPressed: () {}),
              ],
            )
          ],
        ),
      ),
    );
  }
}
