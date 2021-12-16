import 'package:flutter/material.dart';
import 'package:flutter_sample/ui/home/home.dart';
import 'package:flutter_sample/ui/user_detail/user_detail.dart';
import 'package:get/get.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const Home(),
        getPages: [
          GetPage(name: UserDetail.routeName, page: () => const UserDetail())
        ]);
  }
}
