import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_test_case/controllers/home_controller.dart';
import 'package:get/state_manager.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Users')),
      body: SafeArea(
        child: Obx(() {
          if (controller.message.value.isNotEmpty) {
            return Center(child: Text(controller.message.value));
          } else {
            final users = controller.usersState;
            return NotificationListener(
              onNotification: (notification) {
                if (notification is ScrollEndNotification &&
                    notification.metrics.extentAfter == 0) {}
                return false;
              },
              child: RefreshIndicator.adaptive(
                onRefresh: () async {},
                child: ListView.builder(
                  key: const ValueKey('list_user'),
                  itemCount: users.length,
                  itemBuilder: (context, index) {
                    if (index >= users.length && controller.page != null) {
                      return CircularProgressIndicator.adaptive();
                    }

                    final user = users[index];
                    return ListTile(
                      title: Text(user.firstName ?? ''),
                      subtitle: Text(user.lastName ?? ''),
                      leading: CircleAvatar(
                        backgroundImage:
                            Platform.environment.containsKey('FLUTTER_TEST')
                                ? AssetImage('assets/images/dummy_avatar.png')
                                : NetworkImage(user.avatar ?? ''),
                      ),
                    );
                  },
                ),
              ),
            );
          }
        }),
      ),
    );
  }
}
