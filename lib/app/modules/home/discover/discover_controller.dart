import 'package:flutter/foundation.dart';
import 'package:flutter_agora/common/apis/discover_api.dart';
import 'package:flutter_agora/common/models/discover_model/search_result_model.dart';
import 'package:get/get.dart';

class DiscoverController extends GetxController {
  List<Result> searchResults = [];

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

  ///
  void search(String keywords) async {
    String data = await DiscoverApi.search(keywords: keywords);
    searchResults = (await compute(searchResultModelFromJson, data)).results!;
    update();
  }
}
