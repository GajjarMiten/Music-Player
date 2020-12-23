import 'package:flutter/material.dart';
import 'package:flutter_audio_query/flutter_audio_query.dart';
import 'package:musicPlayer/components/AlbumArt.dart';
import 'package:musicPlayer/providers/audio_player.dart';
import 'package:musicPlayer/providers/music_provider.dart';
import 'package:provider/provider.dart';

class MusicList extends StatefulWidget {
  @override
  _MusicListState createState() => _MusicListState();
}

class _MusicListState extends State<MusicList> {
  @override
  Widget build(BuildContext context) {
    final musicProvider = Provider.of<MusicProvider>(context);
    return SliverList(
      delegate: SliverChildListDelegate(
        List<Widget>.generate(musicProvider.musics.length, (index) {
              return MusicTile(index: index,);
            }).toList() +
            [
              SizedBox(
                height: 220,
              ),
            ],
      ),
    );
  }
}

class MusicTile extends StatefulWidget {
  const MusicTile({
    Key key,
    @required this.index,
  }) : super(key: key);

  final int index;

  @override
  _MusicTileState createState() => _MusicTileState();
}

class _MusicTileState extends State<MusicTile> {
  @override
  Widget build(BuildContext context) {
    final musicProvider = Provider.of<MusicProvider>(context);
    final player = Provider.of<Player>(context);
    var music = musicProvider.musics[widget.index];
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: ListTile(
        key: Key(widget.index.toString()),
        onTap: () {
          player.play(music.filePath);
          musicProvider.setCurrentSong(widget.index, music);
        },
        title: Text(
          music.title,
          overflow: TextOverflow.ellipsis,
        ),
        trailing: IconButton(
          onPressed: () {},
          icon: Icon(Icons.favorite),
        ),
        leading: Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            color: Theme.of(context).accentColor,
            borderRadius: BorderRadius.circular(20),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: AlbumArt(musicProvider.musics[widget.index].albumArtwork),
          ),
        ),
      ),
    );
  }
}
