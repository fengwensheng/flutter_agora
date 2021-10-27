import 'package:get/get.dart';
import 'episode_controller.dart';

class EpisodeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EpisodeController>(
      () => EpisodeController(),
    );
  }
}
