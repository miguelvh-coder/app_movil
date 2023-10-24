import 'package:app_oper/domain/models/user.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/user_controller.dart';

class EditUserPage extends StatefulWidget {
  const EditUserPage({super.key});

  @override
  State<EditUserPage> createState() => _EditUserPageState();
}

class _EditUserPageState extends State<EditUserPage> {
  User user = Get.arguments[0];
  final controllerFirstName = TextEditingController();
  final controllerLastName = TextEditingController();
  final controllerEmail = TextEditingController();
  final controllerColegio = TextEditingController();
  final controllerFn = TextEditingController();
  final controllerGrado = TextEditingController();
  final controllerDifficult = TextEditingController();
  final controllerPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    UserController userController = Get.find();
    controllerFirstName.text = user.firstName;
    controllerLastName.text = user.lastName;
    controllerEmail.text = user.email;
    controllerColegio.text = user.colegio;
    controllerFn.text = user.fN;
    controllerGrado.text = user.grado;
    controllerDifficult.text = user.difficult;
    controllerPassword.text = user.password;
    return Scaffold(
      appBar: AppBar(
        title: Text("${user.firstName} ${user.lastName}"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            TextField(
                controller: controllerFirstName,
                decoration: const InputDecoration(
                  labelText: 'First Name',
                )),
            const SizedBox(
              height: 20,
            ),
            TextField(
                controller: controllerLastName,
                decoration: const InputDecoration(
                  labelText: 'Last Name',
                )),
            const SizedBox(
              height: 20,
            ),
            TextField(
                controller: controllerEmail,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  labelText: 'Email',
                )),
            const SizedBox(
              height: 20,
            ),
            TextField(
                controller: controllerColegio,
                keyboardType: TextInputType.name,
                decoration: const InputDecoration(
                  labelText: 'Colegio',
                )),
            const SizedBox(
              height: 20,
            ),
            TextField(
                controller: controllerFn,
                keyboardType: TextInputType.datetime,
                decoration: const InputDecoration(
                  labelText: 'fecha de nacimiento',
                )),
            const SizedBox(
              height: 20,
            ),
             TextField(
                controller: controllerDifficult,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                  labelText: 'dificultad',
                )),
            const SizedBox(
              height: 20,
            ),
            TextField(
                controller: controllerPassword,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                  labelText: 'contraseña',
                )),
            const SizedBox(
              height: 20,
            ),
            TextField(
                controller: controllerGrado,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'grado',
                )),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Expanded(
                      flex: 2,
                      child: ElevatedButton(
                          onPressed: () async {
                            await userController.updateUser(User(
                                id: user.id,
                                email: controllerEmail.text,
                                firstName: controllerFirstName.text,
                                lastName: controllerLastName.text,
                                colegio: controllerColegio.text,
                                fN: controllerFn.text,
                                difficult: controllerDifficult.text,
                                password: controllerPassword.text,
                                grado: controllerGrado.text,

                                ));
                            Get.back();
                          },
                          child: const Text("Update")))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
