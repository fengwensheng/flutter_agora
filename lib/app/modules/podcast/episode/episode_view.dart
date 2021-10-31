import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'episode_controller.dart';

class EpisodeView extends GetView<EpisodeController> {
  void _play() => controller.play();

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
              children: [
                _buildIconButton(Icons.ios_share_sharp),
                _buildIconButton(Icons.check),
                GetBuilder<EpisodeController>(
                  builder: (c) => _buildIconButton(
                    c.isPlaying ? Icons.pause : Icons.play_arrow_outlined,
                    onPressed: _play,
                  ),
                ),
                _buildIconButton(Icons.playlist_add),
                _buildIconButton(Icons.star_border),
              ],
            ),
          ],
        ),
      );

  ///icon button
  Widget _buildIconButton(
    IconData iconData, {
    VoidCallback? onPressed,
  }) =>
      IconButton(
        onPressed: onPressed,
        icon: Icon(iconData),
        padding: EdgeInsets.zero,
        alignment: Alignment.bottomCenter,
        iconSize: 24,
      );

  ///text description about this episode
  Widget _buildDescription() => Container(
        padding: EdgeInsets.symmetric(
          horizontal: 24.0,
          vertical: 16.0,
        ),
        child: Text(
          '${controller.rssItem.description}',
          style: TextStyle(
            letterSpacing: 1.5,
            height: 1.5,
          ),
        ),
      );

  ///底部信息栏
  Widget _buildFootInfo() => Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 24.0,
        ),
        child: Column(
          children: [
            _buildInfoItemRow(
              iconData: Icons.card_travel_sharp,
              title: '${controller.rssFeed.itunes?.owner?.email}',
            ),
            SizedBox(height: 10),
            _buildInfoItemRow(
              iconData: Icons.record_voice_over_outlined,
              title: '${controller.rssFeed.title}',
            ),
            SizedBox(height: 10),
            _buildInfoItemRow(
              iconData: Icons.link,
              title: '${controller.rssFeed.link}',
            ),
            SizedBox(height: 10),
            _buildInfoItemRow(
              iconData: Icons.category_outlined,
              title:
                  '${controller.rssFeed.itunes?.categories.map((e) => e?.category).toList().join(', ')}',
            )
          ],
        ),
      );

  ///
  Widget _buildInfoItemRow({
    required IconData iconData,
    required String title,
  }) =>
      Row(
        children: [
          Icon(iconData),
          const SizedBox(width: 18.0),
          Text('$title'),
        ],
      );
}
