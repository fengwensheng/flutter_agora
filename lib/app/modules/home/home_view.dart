import 'package:flutter/material.dart';
import 'package:flutter_agora/app/modules/home/discover/discover_view.dart';
import 'package:flutter_agora/app/modules/home/library/library_view.dart';
import 'package:flutter_agora/app/modules/home/playlist/playlist_view.dart';
import 'package:flutter_agora/app/modules/home/setting/setting_view.dart';
import 'package:flutter_agora/app/modules/home/subscription/subscription_view.dart';
import 'package:get/get.dart';
import 'home_controller.dart';

class HomeView extends GetView<HomeController> {
  void _onTab(int i) => controller.onTab(i);

  @override
  Widget build(_) => Scaffold(
        backgroundColor: Colors.white,
        appBar: _buildAppBar(),
        body: _buildBody(),
      );

  AppBar _buildAppBar() => AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        title: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: 220,
              height: 40,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                color: Colors.grey[100],
              ),
            ),
            TabBar(
              onTap: _onTab,
              controller: controller.tabController,
              indicator: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(8)),
                color: Colors.grey[800],
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(.2),
                    offset: Offset(1, 3),
                    blurRadius: 3.0,
                    spreadRadius: 1.0,
                  ),
                ],
              ),
              indicatorSize: TabBarIndicatorSize.label,
              labelPadding: EdgeInsets.symmetric(
                vertical: 0,
                horizontal: 0,
              ),
              labelColor: Colors.black,
              tabs: List.generate(
                HomeController.tabIcons.length,
                (i) => Container(
                  margin: const EdgeInsets.symmetric(
                    vertical: 2.0,
                    horizontal: 13.0,
                  ),
                  child: Icon(
                    HomeController.tabIcons[i],
                    size: 25.0,
                  ),
                ),
              ),
            ),
          ],
        ),
      );

  Widget _buildBody() => Stack(
        children: [
          PageView(
            controller: controller.pageController,
            physics: NeverScrollableScrollPhysics(),
            children: [
              SettingView(),
              PlaylistView(),
              LibraryView(),
              SubscriptionView(),
              DiscoverView(),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: _buildAudioBar(),
          ),
        ],
      );

  Widget _buildAudioBar() => Container(
        height: 53,
        margin: EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 15,
        ),
        decoration: BoxDecoration(
          color: Color.fromRGBO(39, 37, 45, 1.0),
          borderRadius: const BorderRadius.all(Radius.circular(8.0)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            FlutterLogo(),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.fast_rewind),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.play_arrow_outlined,
                size: 35,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.fast_forward),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.restaurant_menu),
            ),
          ],
        ),
      );
}
