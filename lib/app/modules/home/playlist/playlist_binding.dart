import 'package:flutter_agora/app/modules/home/playlist/playlist_controller.dart';
import 'package:get/get.dart';

class PlaylistBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PlaylistController>(
      () => PlaylistController(),
    );
  }
}
