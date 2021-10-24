import 'dart:developer';

import 'package:dart_rss/dart_rss.dart';
import 'package:flutter_agora/common/vi_dio.dart';
import 'package:get/get.dart';

class PodcastController extends GetxController {
  final String feedUrl = Get.arguments as String;
  RssFeed rssFeed = RssFeed();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    _setRssFeed();
  }

  void _setRssFeed() async {
    log(feedUrl);
    String xmlString = await ViDio().get(path: feedUrl);
    rssFeed = RssFeed.parse(xmlString);
    update();
  }

  @override
  void onClose() {}
}
