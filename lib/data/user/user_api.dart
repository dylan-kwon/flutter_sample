import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_sample/data/user/user.dart';
import 'package:flutter_sample/util/network/network.dart';

class UserApi {
  Future<List<User>> getUsers({int loadCount = 30}) async {
    try {
      var response = await apiServer
          .get("", query: {"results": "$loadCount"});

      return (json.decode(response.bodyString!)['results'] as List)
          .map((e) => User.fromJson(e))
          .toList();
    } on Exception catch (e) {
      debugPrint(e.toString());
      return [];
    }
  }
}
