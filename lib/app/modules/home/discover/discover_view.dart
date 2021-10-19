import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'discover_controller.dart';

class DiscoverView extends GetView<DiscoverController> {
  void _search(String keywords) => controller.search(keywords);

  @override
  Widget build(_) => GetBuilder<DiscoverController>(
        builder: (c) => ListView.separated(
          padding: EdgeInsets.all(10),
          itemCount: c.searchResults.length + 1,
          itemBuilder: (_, i) =>
              (i == 0) ? _buildSearchBar() : _buildResultRow(i - 1),
          separatorBuilder: (_, i) => const SizedBox(height: 10),
        ),
      );

  Widget _buildSearchBar() => Container(
        alignment: Alignment.center,
        height: 40.0,
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey[300]!,
            width: 1.5,
          ),
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
        ),
        child: TextField(
          onSubmitted: (v) => _search(v),
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
      );

  Widget _buildResultRow(int i) => Row(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(8.0)),
            child: Image.network(
              '${controller.searchResults[i].artworkUrl100}',
              width: 32,
              height: 32,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 10),
          Text(
            '${controller.searchResults[i].collectionName}',
          ),
        ],
      );
}
