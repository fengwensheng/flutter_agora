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
                _buildDescription(),
                _buildFootInfo(),
              ],
            ),
          ),
        ),
      );

  Widget _buildEpisodeCard() => Container(
        margin: const EdgeInsets.all(8.0),
        padding: const EdgeInsets.all(16.0),
        height: 135,
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
            //logo + title
            Row(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                  child: Image.network(
                    '${controller.rssItem.itunes?.image?.href}',
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
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 5),
            //duration + date
            Row(
              children: [
                const SizedBox(width: 42),
                Text(
                  '${controller.rssItem.itunes?.duration?.inMinutes} MIN',
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 12,
                  ),
                ),
                Spacer(),
                Text(
                  '${controller.rssItem.pubDate!.split(', ')[1].split(' ').take(3).join(' ')}',
                  style: TextStyle(
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
            Spacer(),
            //toolbar
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: iconDatas.map((e) => _buildIconButton(e)).toList(),
            ),
          ],
        ),
      );

  ///toolbar icons
  static const iconDatas = [
    Icons.ios_share_sharp,
    Icons.check,
    Icons.play_arrow_outlined,
    Icons.playlist_add,
    Icons.star_border,
  ];

  ///icon button
  Widget _buildIconButton(
    IconData iconData,
  ) =>
      IconButton(
        onPressed: () {},
        icon: Icon(iconData),
        padding: EdgeInsets.zero,
        alignment: Alignment.bottomCenter,
        iconSize: 24,
      );

  ///text description about this episode
  Widget _buildDescription() => Container(
        padding: EdgeInsets.all(16.0),
        child: Text(
          '${controller.rssItem.description}',
          style: TextStyle(
            letterSpacing: 1.5,
            height: 1.5,
          ),
        ),
      );

  ///底部信息栏
  Widget _buildFootInfo() => _buildInfoItemRow();

  ///
  Widget _buildInfoItemRow() => Row(
        children: [
          Icon(Icons.card_travel_sharp),
          Text(
            '${controller.rssFeed.title}',
          ),
        ],
      );
}
