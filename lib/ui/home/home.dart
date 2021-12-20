import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sample/data/user/user.dart';
import 'package:flutter_sample/data/user/user_api.dart';
import 'package:flutter_sample/ui/user_detail/user_detail.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(_HomeController());

    return Scaffold(
        appBar: AppBar(
          title: Obx(() => Text(controller.title.value)),
        ),
        body: Stack(
          children: [
            _buildUsers(controller),
            _buildLoadingProgress(controller)
          ],
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.refresh),
          onPressed: controller.loadUsers,
        ));
  }

  Widget _buildLoadingProgress(_HomeController controller) =>
      Obx(() => Visibility(
          child: const Center(
            child: CircularProgressIndicator(),
          ),
          visible: controller.isLoading.value));

  Widget _buildUsers(_HomeController controller) => Obx(() => ListView.builder(
      itemCount: controller.users.length * 2,
      itemBuilder: (context, i) {
        if (i.isOdd) {
          return Container(
              width: double.infinity,
              height: 1,
              color: const Color(0xffeeeeee));
        }
        final index = i ~/ 2;
        var user = controller.users[index];
        return _buildRow(user, controller);
      }));

  Widget _buildRow(User user, _HomeController controller) {
    var name = "${user.name?.first} ${user.name?.last}";
    var imageUrl = user.picture?.thumbnail;

    return InkWell(
        child: Container(
          margin: const EdgeInsets.all(10),
          child: Row(
            children: [
              CachedNetworkImage(
                width: 50,
                height: 50,
                fit: BoxFit.cover,
                imageUrl: imageUrl ?? "",
              ),
              Container(
                margin: const EdgeInsets.only(left: 10),
                child: Text(name),
              )
            ],
          ),
        ),
        onTap: () {
          controller.navigateUserDetail(user);
        });
  }
}

class _HomeController extends GetxController {
  final title = "Users".obs;

  final users = <User>[].obs;

  var isLoading = false.obs;

  var userApi = Get.find<UserApi>();

  void loadUsers() async {
    isLoading.value = true;

    users.value = await userApi.getUsers();

    isLoading.value = false;
  }

  void navigateUserDetail(User user) {
    Get.toNamed(UserDetail.routeName, arguments: UserDetailArguments(user));
  }
}
