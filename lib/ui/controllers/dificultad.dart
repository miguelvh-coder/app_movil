import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class dificultad extends GetxController {
  final _difficultya = 1.obs;
  final _difficultyb = 1.obs;

  get difficultya => _difficultya.value;
  get difficultyb => _difficultyb.value;

  diffa_plus() => _difficultya.value++;
  diffa_minus() => _difficultya.value--;

  diffb_plus() => _difficultyb.value++;
  diffb_minus() => _difficultyb.value--;

  set_dificultad(int a, int b){
    _difficultya.value = a;
    _difficultyb.value = b;
  }
}

//LISTO