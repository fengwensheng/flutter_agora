import 'package:dart_rss/dart_rss.dart';
import 'package:flutter_agora/app/routes/app_pages.dart';
import 'package:flutter_agora/common/vi_dio.dart';
import 'package:get/get.dart';

class PodcastController extends GetxController {
  final String feedUrl = Get.arguments as String;
  RssFeed rssFeed = RssFeed();
  //current palying episode url
  String cUrl = '';

  void set currentUrl(String url) {
    cUrl = url;
    update();
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    _setRssFeed();
  }

  @override
  void onClose() {}

  void _setRssFeed() async {
    String xmlString = await ViDio().get(path: feedUrl);
    rssFeed = RssFeed.parse(xmlString);
    update();
  }

  ///to episode detail, you can pay it on that
  void toEpisode(int i) => Get.toNamed(
        Routes.EPISODE,
        arguments: {
          'rssFeed': rssFeed,
          'i': i,
        },
      );

  ///
  bool isPlayingItem(String url) => url == cUrl;
}
