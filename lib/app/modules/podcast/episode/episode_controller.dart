import 'package:dart_rss/dart_rss.dart';

import 'package:get/get.dart';

class EpisodeController extends GetxController {
  final RssFeed rssFeed = Get.arguments['rssFeed'] as RssFeed;
  final int i = Get.arguments['i'] as int;
  late final RssItem rssItem;

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
}
