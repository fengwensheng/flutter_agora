import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
        padding: EdgeInsets.symmetric(vertical: 7.0),
        shape: RoundedRectangleBorder(
          borderRadius: const BorderRadius.all(const Radius.circular(8.0)),
        ),
        duration: Duration(seconds: 2),
      ),
    );
  }
}
