import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'episode_controller.dart';

class EpisodeView extends GetView<EpisodeController> {
  @override
  Widget build(_) => Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                _buildEpisodeCard(),
              ],
            ),
          ),
        ),
      );

  Widget _buildEpisodeCard() => Container(
        margin: const EdgeInsets.all(8.0),
        padding: const EdgeInsets.all(16.0),
        height: 130,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.all(Radius.circular(8.0)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey[300]!,
              offset: Offset(0, 40),
              blurRadius: 30.0,
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                  child: Image.network(
                    '${controller.rssItem.itunes?.image}',
                    width: 32,
                    height: 32,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    '${controller.rssItem.title}',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.ios_share),
                  padding: EdgeInsets.zero,
                  alignment: Alignment.bottomLeft,
                  iconSize: 30,
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.bookmark_add_outlined),
                  padding: EdgeInsets.zero,
                  alignment: Alignment.bottomCenter,
                  iconSize: 30,
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.list),
                  padding: EdgeInsets.zero,
                  alignment: Alignment.bottomRight,
                  iconSize: 30,
                ),
              ],
            ),
          ],
        ),
      );
}
