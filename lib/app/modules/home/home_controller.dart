import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
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
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
