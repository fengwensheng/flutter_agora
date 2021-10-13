import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'subscription_controller.dart';

class SubscriptionView extends GetView<SubscriptionController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'SubscriptionView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
