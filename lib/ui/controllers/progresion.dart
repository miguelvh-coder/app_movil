import 'dart:async';

import 'package:get/get.dart';

class progresion extends GetxController {

  Rx<Duration> elapsedTime = Duration.zero.obs;
  late Timer _timer;

  void empezar() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      elapsedTime.value = Duration(seconds: timer.tick);
    });
  }

  void terminar() {
    _timer.cancel();
  }

  int getTime() {
    return elapsedTime.value.inSeconds;
  }

  void reset() {
    elapsedTime.value = Duration.zero;
  }
}