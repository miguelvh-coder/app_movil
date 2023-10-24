import '../data/data_remote/models/some_data_db.dart';
import 'package:app_oper/domain/models/user.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

import '../ui/controllers/person_controller.dart';

class LocalDataSource {
    PersonController perController = Get.find();

  Future<void> addElement(User entry) async {
    Hive.box('user').add(SomeData(
        correo: entry.email,
        firstName: entry.firstName,
        lastName: entry.lastName,
        birthday: entry.fN,
        course: entry.grado,
        password: entry.password,
        difficult: entry.difficult,
        school: entry.colegio));
  }
  Future<bool> getUser(String email, String password) async {
    List<User> usuarios = await getAll();
    for (var i = 0; i < usuarios.length; i++) {
      if (usuarios[i].email == email && usuarios[i].password == password) {
        return Future.value(true);
      }
    }
    return Future.value(false);
  }
  //verificar que el correo no este registrado
  Future<bool> verifyUser(String email) async {
    List<User> usuarios = await getAll();
    for (var i = 0; i < usuarios.length; i++) {
      if (usuarios[i].email == email) {
        return Future.value(true);
      }
    }
    return Future.value(false);
  }
  Future<List<User>> getAll() async {
    return Hive.box('user').values.map((e) => User(
      id: e.key as int,
      email: e.correo,
      firstName: e.firstName,
      lastName: e.lastName,
      fN: e.birthday,
      grado: e.course,
      password: e.password,
      difficult: e.difficult,
      colegio: e.school,
    )).toList();
  }
  Future<void> deleteAll() async {
    Hive.box('user').clear();
  }
  Future<void> deleteEntry(User entry) async {
    Hive.box('user').deleteAt(entry.id!);
  }

  //actulizare la informacion del usuario apartir de playercontroller

  Future<void> updateEntry() async {
    Hive.box('user').put(perController.id, User(
        email: perController.email.value,
        firstName: perController.firstName.value,
        lastName: perController.lastName.value,
        fN: perController.birthday.value,
        grado: perController.course.value,
        password: perController.password.value,
        difficult: perController.difficult.value.toString(),
        colegio: perController.school.value));
  }
}