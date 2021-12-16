import 'package:get/get.dart';
import 'package:get/get_connect/http/src/request/request.dart';

class HttpClient extends GetConnect {
  HttpClient(String baseUrl, {Map<String, String>? defaultHeader}) {
    httpClient.baseUrl = baseUrl;
    httpClient.addRequestModifier((Request request) {
      if (defaultHeader != null) {
        request.headers.addAll(defaultHeader);
      }
      return request;
    });
  }
}

late final apiServer = HttpClient("https://randomuser.me/api");
