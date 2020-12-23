import 'package:flutter_audio_query/flutter_audio_query.dart';

class MusicRepo {
  static final FlutterAudioQuery _audioQuery = FlutterAudioQuery();

  Future<List<SongInfo>> getMusic() async {
    var data = await _audioQuery.getSongs();
    return data;
  }
}
