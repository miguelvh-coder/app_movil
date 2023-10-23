import 'package:app_oper/ui/pages/content/edit_user.dart';
import 'package:app_oper/ui/pages/content/pregunta.dart';
import 'package:app_oper/ui/widgets/operacion.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loggy/loggy.dart';

import '../../../domain/models/user.dart';
import '../../controllers/authentication_controller.dart';
import '../../controllers/user_controller.dart';
import '../../controllers/answer.dart';
import '../../controllers/dificultad.dart';
import '../../controllers/progresion.dart';
import '../../controllers/result_writer.dart';
import 'new_user.dart';

class UserListPage extends StatefulWidget {
  const UserListPage({super.key});

  @override
  State<UserListPage> createState() => _UserListPageState();
}

void recargar(){
  dificultad controller = Get.find();
  answer controller2 = Get.find();
  result_writer controller3 = Get.find();
  progresion tempo = Get.find();

  int dia = controller.difficultya;
  int dib = controller.difficultyb;
  controller2.generar_q(dia,dib);
    
  tempo.reset();
  tempo.empezar();
  controller2.reiniciarp();
  controller3.reinicio();

}

class _UserListPageState extends State<UserListPage> {
  UserController userController = Get.find();
  AuthenticationController authenticationController = Get.find();

  _logout() async {
    try {
      await authenticationController.logOut();
    } catch (e) {
      logInfo(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Welcome"), actions: [
        IconButton(
            icon: const Icon(Icons.exit_to_app),
            onPressed: () {
              _logout();
            }),
        IconButton(
            icon: const Icon(Icons.access_time),
            onPressed: () {
              userController.simulateProcess();
            }),
            IconButton(
            icon: const Icon(Icons.question_mark),
            onPressed: () {
              recargar();
              Get.to(() => const CalculatorApp());
            }),
      ]),
      body: Center(child: _getXlistView()),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          logInfo("Add user from UI");
          Get.to(() => const NewUserPage());
        },
        child: const Icon(Icons.add),
      ),
      /*FloatingActionButton(
        onPressed: () async {
          logInfo("Hacer cuestionario");
          Get.to(() => const CalculatorApp());
        },
        child: const Icon(Icons.add),
      ),*/
    );
  }

  Widget cuestionario() {
    return Obx(
      () => ListView.builder(
        itemCount: userController.users.length,
        itemBuilder: (context, index) {
          User user = userController.users[index];
          return Dismissible(
            key: UniqueKey(),
            background: Container(
                color: Colors.red,
                alignment: Alignment.centerLeft,
                child: const Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Text(
                    "Deleting",
                    style: TextStyle(color: Colors.white),
                  ),
                )),
            onDismissed: (direction) {
              userController.deleteUser(user.id!);
            },
            child: Card(
              child: ListTile(
                title: Text(user.name),
                subtitle: Text(user.email),
                onTap: () {
                  Get.to(() => const CalculatorApp());
                },
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _getXlistView() {
    return Obx(
      () => ListView.builder(
        itemCount: userController.users.length,
        itemBuilder: (context, index) {
          User user = userController.users[index];
          return Dismissible(
            key: UniqueKey(),
            background: Container(
                color: Colors.red,
                alignment: Alignment.centerLeft,
                child: const Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Text(
                    "Deleting",
                    style: TextStyle(color: Colors.white),
                  ),
                )),
            onDismissed: (direction) {
              userController.deleteUser(user.id!);
            },
            child: Card(
              child: ListTile(
                title: Text(user.name),
                subtitle: Text(user.email),
                onTap: () {
                  Get.to(() => const EditUserPage(),
                      arguments: [user, user.id]);
                },
              ),
            ),
          );
        },
      ),
    );
  }
}