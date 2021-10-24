import 'package:flutter_agora/app/modules/podcast/podcast_binding.dart';
import 'package:flutter_agora/app/modules/podcast/podcast_view.dart';
import 'package:get/get.dart';

import 'package:flutter_agora/app/modules/home/discover/discover_binding.dart';
import 'package:flutter_agora/app/modules/home/discover/discover_view.dart';
import 'package:flutter_agora/app/modules/home/home_binding.dart';
import 'package:flutter_agora/app/modules/home/home_view.dart';
import 'package:flutter_agora/app/modules/home/library/library_binding.dart';
import 'package:flutter_agora/app/modules/home/library/library_view.dart';
import 'package:flutter_agora/app/modules/home/playlist/playlist_binding.dart';
import 'package:flutter_agora/app/modules/home/playlist/playlist_view.dart';
import 'package:flutter_agora/app/modules/home/setting/setting_binding.dart';
import 'package:flutter_agora/app/modules/home/setting/setting_view.dart';
import 'package:flutter_agora/app/modules/home/subscription/subscription_binding.dart';
import 'package:flutter_agora/app/modules/home/subscription/subscription_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
      children: [
        GetPage(
          name: _Paths.SETTING,
          page: () => SettingView(),
          binding: SettingBinding(),
        ),
        GetPage(
          name: _Paths.SUBSCRIPTION,
          page: () => SubscriptionView(),
          binding: SubscriptionBinding(),
        ),
        GetPage(
          name: _Paths.DISCOVER,
          page: () => DiscoverView(),
          binding: DiscoverBinding(),
        ),
        GetPage(
          name: _Paths.PLAYLIST,
          page: () => PlaylistView(),
          binding: PlaylistBinding(),
        ),
        GetPage(
          name: _Paths.LIBRARY,
          page: () => LibraryView(),
          binding: LibraryBinding(),
        ),
      ],
    ),
    GetPage(
      name: _Paths.PODCAST,
      page: () => PodcastView(),
      binding: PodcastBinding(),
    ),
  ];
}
