import 'package:flutter/material.dart';
import 'package:flutter_agora/app/routes/app_pages.dart';
import 'package:flutter_agora/global.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Global.init();
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(_) => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Flugora",
        initialRoute: AppPages.INITIAL,
        getPages: AppPages.routes,
      );
}
