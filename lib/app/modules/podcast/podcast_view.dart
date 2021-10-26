import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'podcast_controller.dart';

class PodcastView extends GetView<PodcastController> {
  void _play(String url) => controller.play(url);

  @override
  Widget build(_) => Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: GetBuilder<PodcastController>(
            builder: (c) => c.rssFeed.title == null
                ? Center(child: CircularProgressIndicator())
                : ListView.separated(
                    padding: const EdgeInsets.all(10),
                    itemCount: c.rssFeed.items.length + 2,
                    separatorBuilder: (_, i) => const SizedBox(height: 10),
                    itemBuilder: (_, i) {
                      if (i == 0) {
                        return _buildHeaderInfo();
                      } else if (i == 1) {
                        return SizedBox();
                      } else {
                        return _buildPodcastItem(i - 2);
                      }
                    },
                  ),
          ),
        ),
      );

  Widget _buildHeaderInfo() => Container(
        height: 115,
        padding: const EdgeInsets.all(16.0),
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
                    '${controller.rssFeed.itunes?.image?.href}',
                    width: 32,
                    height: 32,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    '${controller.rssFeed.title}',
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

  Widget _buildPodcastItem(int i) => GestureDetector(
        onTap: () => _play('${controller.rssFeed.items[i].enclosure?.url}'),
        child: Container(
          height: 120,
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: Colors.grey[100],
            borderRadius: const BorderRadius.all(Radius.circular(8.0)),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                child: Image.network(
                  '${controller.rssFeed.items[i].itunes?.image?.href ?? controller.rssFeed.itunes?.image?.href}',
                  width: 32,
                  height: 32,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      '${controller.rssFeed.items[i].title}',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        height: 1.5,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '${controller.rssFeed.items[i].itunes?.duration?.inMinutes} MIN',
                          style: TextStyle(
                            color: Colors.grey[600],
                          ),
                        ),
                        Text(
                          '${controller.rssFeed.items[i].pubDate!.split(', ')[1].split(' ').take(3).join(' ')}',
                          style: TextStyle(
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
}
