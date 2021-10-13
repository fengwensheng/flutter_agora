import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'playlist_controller.dart';

class PlaylistView extends GetView<PlaylistController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'PlaylistView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
