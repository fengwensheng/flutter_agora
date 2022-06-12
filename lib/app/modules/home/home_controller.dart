import 'package:flutter/material.dart';
import 'package:flutter_agora/common/vi_audio_player.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class HomeController extends GetxController
    with GetSingleTickerProviderStateMixin {
  static const tabLabels = [
    '设置',
    '播放列表',
    '播客库',
    '订阅',
    '发现',
  ];
  static const tabIcons = [
    Icons.settings,
    Icons.list_alt_rounded,
    Icons.library_books,
    Icons.bookmark_add_rounded,
    Icons.search_rounded
  ];
  late TabController tabController;
  PageController pageController = PageController();
  final box = GetStorage();
  bool isPlaying = false;
  @override
  void onInit() {
    super.onInit();
    tabController = TabController(length: tabLabels.length, vsync: this);
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  void onTab(int i) {
    if (pageController.page == i) return;
    pageController.jumpToPage(i);
    ScaffoldMessenger.of(Get.context!).hideCurrentSnackBar();
    ScaffoldMessenger.of(Get.context!).showSnackBar(
      SnackBar(
        content: Text(
          '${tabLabels[i]}',
          textAlign: TextAlign.center,
        ),
        behavior: SnackBarBehavior.floating,
        margin: EdgeInsets.symmetric(
          vertical: 50,
          horizontal: 10,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: const BorderRadius.all(const Radius.circular(8.0)),
        ),
        duration: Duration(seconds: 2),
      ),
    );
  }

  ///
  ///play audio by supported online url
  void play(String url) async {
    if (isPlaying) {
      ViAudioPlayer().pause();
    } else {
      ViAudioPlayer().isInit()
          ? ViAudioPlayer().play(url)
          : ViAudioPlayer().play(null);
    }
    isPlaying = !isPlaying;
    update();
  }
}
