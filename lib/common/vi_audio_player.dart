import 'package:just_audio/just_audio.dart';

class ViAudioPlayer {
  factory ViAudioPlayer() => _viAudioPlayer;
  static final ViAudioPlayer _viAudioPlayer = ViAudioPlayer._();
  ViAudioPlayer._() {
    _audioPlayer = AudioPlayer();
  }
  late AudioPlayer _audioPlayer;

  ///play
  Future<void> play(String url) async {
    await _audioPlayer.setUrl(url);
    _audioPlayer.play();
  }

  ///pause
  Future<void> pause() async => _audioPlayer.pause();
}
