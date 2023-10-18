import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:app_oper/ui/pages/content/user_list.dart';
import 'package:app_oper/ui/controllers/progresion.dart';
import 'package:app_oper/ui/controllers/dificultad.dart';
import '../../controllers/answer.dart';


class end_page extends StatelessWidget {
  const end_page({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ep(),
    );
  }
}

class ep extends StatefulWidget {
  @override
  _ep createState() => _ep();
}

String minutos(int segu) {
  int minutos = segu ~/ 60;
  int segundos = segu % 60;
  String min = minutos.toString();
  String seg = segundos.toString();
  if (minutos < 10) {
    min = "0$minutos";
  }
  if (segundos < 10) {
    seg = "0$segundos";
  }
  return "$min:$seg";
}

void newDiff(int cans, int se) {
  dificultad difficulty = Get.find();
    if (cans >= 4  && se < 120) {
      if(difficulty.difficultya.value == 1){
        difficulty.diffa_plus();
      }else if(difficulty.difficultyb == 1){
        difficulty.diffb_plus();
      }
    }
  }

class _ep extends State<ep> {


  @override
  Widget build(BuildContext context) {
    answer controller = Get.find();
    progresion tempo = Get.find();

    return Scaffold(
      
      appBar: AppBar(
        title: const Text("Fin de módulo"),
      ),
      body: Center(
        child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          
          Container(
            color: Colors.amber,
            child:(
              const Text(
                'Fin de la sesión', // Muestra el int convertido o un mensaje de error
                style: TextStyle(fontSize: 32.0), // Ajusta el tamaño de la fuente del texto
              )
            )
          ),
          Container(
            color: const Color.fromARGB(255, 235, 235, 235),
            child:(
              const Text(
                'Su puntuación fue:', // Muestra el int convertido o un mensaje de error
                style: TextStyle(fontSize: 22.0), // Ajusta el tamaño de la fuente del texto
              )
            )
          ),
          Container(
            color: Color.fromARGB(255, 172, 172, 172),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children:[
                Padding(
                  padding:const EdgeInsets.all(20.0), // Ajusta el espacio alrededor del textonull, // Cambia null por la función que debe ejecutarse cuando se presione el botón
                    child: Obx(() {
                    final point = controller.puntuacion.toString();

                    return Text(
                      'Respuestas correctas: $point/6', // Muestra el int convertido o un mensaje de error
                      style: const TextStyle(fontSize: 18.0), // Ajusta el tamaño de la fuente del texto
                    );
                  }),
                ),

                Padding(
                  padding:const EdgeInsets.all(20.0), // Ajusta el espacio alrededor del textonull, // Cambia null por la función que debe ejecutarse cuando se presione el botón
                    child: Obx(() {
                    final tt = minutos(tempo.getTime());

                    return Text(
                      'Tiempo total = $tt', // Muestra el int convertido o un mensaje de error
                      style: const TextStyle(fontSize: 18.0), // Ajusta el tamaño de la fuente del texto
                    );
                  }),
                ),

              ],
            )
          ),
          
          Container(
            color: tempo.getTime() <=120 && controller.puntuacion >=4 ? Colors.green:Colors.red,
            
            child: Obx(() {
                    final tt =tempo.getTime();
                    final point = controller.puntuacion;
                    if(tt <= 120 && point >= 4){
                      return Text(
                        'Su dificultad aumentó', // Muestra el int convertido o un mensaje de error
                        style: const TextStyle(fontSize: 18.0), // Ajusta el tamaño de la fuente del texto
                      );
                    }else{
                      return Text(
                        'Su dificultad permanece igual', // Muestra el int convertido o un mensaje de error
                        style: const TextStyle(fontSize: 18.0), // Ajusta el tamaño de la fuente del texto
                      );
                    }

                  }),
            
          ),
          ElevatedButton(onPressed: () {Get.to(const UserListPage());},
           child: const Text('volver', // Muestra el int convertido o un mensaje de error
                      style: const TextStyle(fontSize: 18.0), // Ajusta el tamaño de la fuente del texto
                    ),
          )
        ],
      ),
      )
    );
  }
}