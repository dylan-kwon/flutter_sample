import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sample/data/user/user.dart';
import 'package:get/get.dart';

class UserDetail extends StatelessWidget {
  static const String routeName = "/user_detail";

  const UserDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var args =
        ModalRoute.of(context)?.settings.arguments as UserDetailArguments;

    var user = args.user;
    var name = "${user.name?.first} ${user.name?.last}";
    var imageUrl = user.picture?.large ?? "";

    return Container(
        color: const Color(0xFFFFFFFF),
        child: Column(
          children: [
            Stack(
              children: [
                CachedNetworkImage(
                  width: double.infinity,
                  fit: BoxFit.fitWidth,
                  imageUrl: imageUrl,
                ),
                GestureDetector(
                  child: Container(
                    margin: const EdgeInsets.only(left: 5, top: 30),
                    padding: const EdgeInsets.all(10),
                    child: const Icon(Icons.arrow_back),
                  ),
                  onTap: () => Get.back(),
                )
              ],
            ),
            Row(
              children: [
                Expanded(
                    child: Container(
                  alignment: Alignment.centerLeft,
                  margin: const EdgeInsets.only(top: 10, left: 10),
                  child: Text(name,
                      style: const TextStyle(
                          color: Color(0xFF000000), fontSize: 24)),
                ))
              ],
            )
          ],
        ));
  }
}

class UserDetailArguments {
  late User user;

  UserDetailArguments(this.user);
}
