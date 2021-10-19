import 'package:flutter_agora/app/modules/home/discover/discover_controller.dart';
import 'package:get/get.dart';

import 'home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
    //lazyPut throws error once switched to other tab, and back
    Get.put<DiscoverController>(
      DiscoverController(),
    );
  }
}
