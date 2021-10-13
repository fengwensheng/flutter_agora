import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'setting_controller.dart';

class SettingView extends GetView<SettingController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'SettingView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
