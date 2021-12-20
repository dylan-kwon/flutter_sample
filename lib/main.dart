import 'package:flutter/material.dart';
import 'package:flutter_sample/translation/app_translation.dart';
import 'package:flutter_sample/ui/home/home.dart';
import 'package:flutter_sample/ui/user_detail/user_detail.dart';
import 'package:get/get.dart';

import 'data/user/user_api.dart';
import 'util/network/network.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key) {
    _initGetX();
  }

  void _initGetX() {
    Get.lazyPut(() => UserApi());
    Get.lazyPut(() => HttpClient("https://randomuser.me/api"));
  }

  @override
  Widget build(BuildContext context) => GetMaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          locale: Get.deviceLocale,
          translations: AppTranslation(),
          home: const Home(),
          getPages: [
            GetPage(name: UserDetail.routeName, page: () => const UserDetail())
          ]);
}
