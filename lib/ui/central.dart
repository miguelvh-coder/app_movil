import 'package:app_oper/ui/controllers/authentication_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'pages/authentication/login.dart';
import 'pages/content/user_list.dart';

class Central extends StatelessWidget {
  const Central({super.key});

  @override
  Widget build(BuildContext context) {
    AuthenticationController authenticationController = Get.find();
    return Obx(() => authenticationController.isLogged
        ? const UserListPage()
        : const LoginPage());
  }
}