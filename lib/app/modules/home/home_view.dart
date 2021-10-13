import 'package:flutter/material.dart';
import 'package:flutter_agora/app/modules/home/discover/discover_view.dart';
import 'package:flutter_agora/app/modules/home/library/library_view.dart';
import 'package:flutter_agora/app/modules/home/playlist/playlist_view.dart';
import 'package:flutter_agora/app/modules/home/setting/setting_view.dart';
import 'package:flutter_agora/app/modules/home/subscription/subscription_view.dart';
import 'package:get/get.dart';
import 'home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(_) => DefaultTabController(
        length: 5,
        child: Scaffold(
          appBar: _buildAppBar(),
          body: _buildBody(),
        ),
      );

  AppBar _buildAppBar() => AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text(
          '设置',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        bottom: TabBar(
          labelColor: Colors.black,
          tabs: List.generate(
            HomeController.tabIcons.length,
            (i) => Icon(HomeController.tabIcons[i]),
          ),
        ),
      );

  Widget _buildBody() => TabBarView(
        children: [
          SettingView(),
          PlaylistView(),
          LibraryView(),
          SubscriptionView(),
          DiscoverView(),
        ],
      );
}
