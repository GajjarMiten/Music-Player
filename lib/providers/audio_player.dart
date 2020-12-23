import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/foundation.dart';

class Player with ChangeNotifier {
  final AudioPlayer _audioPlayer = AudioPlayer(playerId: "one");
  // AudioPlayerState state = AudioPlayerState.STOPPED;

  AudioPlayerState get state => _audioPlayer.state;

  Stream<AudioPlayerState> get stateStream => _audioPlayer.onPlayerStateChanged;

  Stream<Duration> get durationStream => _audioPlayer.onAudioPositionChanged;

  void resume() {
    _audioPlayer.resume();
  }

  void pause() {
    _audioPlayer.pause();
  }

  void play(String path) {
    _audioPlayer.play(path, isLocal: true);
  }

  void stop() {
    _audioPlayer.stop();
  }
}
