import 'package:get_storage/get_storage.dart';

class Global {
  static Future<void> init() async {
    ///getx edition sp
    GetStorage.init();
  }
}
