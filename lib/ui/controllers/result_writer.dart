import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class result_writer extends GetxController {

  final _result = 0.obs;
  int get result => _result.value;

  final _contador = 1.obs;
  int get contador => _contador.value;
  
  newdigit(int a) => _result.value = _result.value * 10 + a;
  reset() => _result.value = 0;

  aumento() => _contador.value++;
  reinicio() => _contador.value = 1;
  int actual() => _contador.value;

  
}

//LISTO