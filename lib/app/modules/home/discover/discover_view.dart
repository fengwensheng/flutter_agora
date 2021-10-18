import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'discover_controller.dart';

class DiscoverView extends GetView<DiscoverController> {
  void _search(String keywords) => log('$keywords');

  @override
  Widget build(_) => Container(
        alignment: Alignment.topCenter,
        color: Colors.white,
        child: Container(
          alignment: Alignment.center,
          height: 40.0,
          margin: EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.grey[300]!,
              width: 1.5,
            ),
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
          ),
          child: TextField(
            onSubmitted: _search,
            cursorColor: Colors.black,
            decoration: InputDecoration(
              hintText: 'Search a podcast or feed',
              contentPadding: EdgeInsets.symmetric(
                horizontal: 16.0,
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ),
      );
}
