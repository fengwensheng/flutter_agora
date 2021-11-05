import 'package:flutter_agora/app/modules/home/audio_bar_model.dart';
import 'package:flutter_agora/common/values/values.dart';
import 'package:get_storage/get_storage.dart';
import 'package:just_audio/just_audio.dart';

class ViAudioPlayer {
  factory ViAudioPlayer() => _viAudioPlayer;
  static final ViAudioPlayer _viAudioPlayer = ViAudioPlayer._();
  ViAudioPlayer._() {
    _audioPlayer = AudioPlayer();
  }
  late AudioPlayer _audioPlayer;

  ///play
  Future<void> play(String? url) async {
    AudioBarModel audioBar = audioBarModelFromJson(
      GetStorage().read(audioBarKey),
    );
    String? curUrl = audioBar.url;
    if (url == null || url == curUrl) {
      _audioPlayer.play();
      return;
    }
    await _audioPlayer.setUrl(url);
    _audioPlayer.play();
  }

  ///pause
  Future<void> pause() async => _audioPlayer.pause();

  ///not set a source
  bool isInit() => _audioPlayer.playerState == ProcessingState.idle;
}
