import 'package:dart_rss/dart_rss.dart';
import 'package:flutter_agora/app/modules/podcast/podcast_controller.dart';
import 'package:flutter_agora/common/vi_audio_player.dart';
import 'package:get/get.dart';

class EpisodeController extends GetxController {
  final RssFeed rssFeed = Get.arguments['rssFeed'] as RssFeed;
  final int i = Get.arguments['i'] as int;
  late final RssItem rssItem;
  //current episode is in playing state
  bool isPlaying = false;

  @override
  void onInit() {
    super.onInit();
    rssItem = rssFeed.items[i];
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  ///play audio by supported online url
  void play() async {
    if (isPlaying) {
      ViAudioPlayer().pause();
    } else {
      String url = '${rssItem.enclosure?.url}';
      ViAudioPlayer().play(url);
      Get.find<PodcastController>().currentUrl = url;
    }
    isPlaying = !isPlaying;
    update();
  }
}
