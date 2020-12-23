import 'package:flutter/foundation.dart';
import 'package:flutter_audio_query/flutter_audio_query.dart';
import 'package:musicPlayer/db/db.dart';
import 'package:musicPlayer/repository/music_repo.dart';

class MusicProvider with ChangeNotifier {
  List<SongInfo> _songList = [];
  List<bool> _musicTileStates = [];

  Map<String, dynamic> _currentSong = {
    'index': "",
    'song': Song(),
  };

  final DB _db = DB();

  DB get db => _db;
  bool getTileState(int index) => _musicTileStates[index];

  Map<String, dynamic> get currentSong => _currentSong;

  List<SongInfo> get musics => _songList;

  final MusicRepo _musicRepo = MusicRepo();

  MusicProvider.init() {
    readMusic();
  }

  Future<void> readMusic() async {
    _songList = await _musicRepo.getMusic();
    _musicTileStates = _songList.map((e) => false).toList();
    notifyListeners();
  }

  void setCurrentSong(int index, SongInfo song) {
    _currentSong['index'] = index;
    _currentSong['song'] = song;
    // _musicTileStates
    print(_currentSong);
    notifyListeners();
  }
}

class Song {
  String title = "Play a Song";
  String artist = "Mi10";
  String albumArtwork;
  String duration = "40000";
}
