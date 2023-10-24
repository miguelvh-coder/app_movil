import 'package:get/get.dart';
import 'package:loggy/loggy.dart';

import '../models/history.dart';
import '../models/user.dart';
import '../repositories/repository.dart';

class UserUseCase {
  final Repository _repository = Get.find();

  UserUseCase();

  Future<List<User>> getUsers() async {
    logInfo("Getting users  from UseCase");
    return await _repository.getUsers();
  }

  Future<void> addUser(User user) async => await _repository.addUser(user);

  Future<void> updateUser(User user) async =>
      await _repository.updateUser(user);

  deleteUser(int id) async => await _repository.deleteUser(id);

  Future<void> saveHis(History his) async{
  logInfo("Saving in repository");
  await _repository.saveHis(his);}

  Future<List> getHis(String email) async{
  logInfo("Saving in repository");
  return await _repository.getHis(email);}

  simulateProcess() async => await _repository.simulateProcess();
}