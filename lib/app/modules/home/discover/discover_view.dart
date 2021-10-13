import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'discover_controller.dart';

class DiscoverView extends GetView<DiscoverController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'DiscoverView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
