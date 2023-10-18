
import 'package:app_oper/ui/pages/content/end_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:app_oper/ui/controllers/progresion.dart';
import '../controllers/result_writer.dart';
import '../controllers/answer.dart';
import '../controllers/dificultad.dart';
import '../pages/content/pregunta.dart';



class botones extends StatelessWidget {
   botones({super.key, required this.button, });

  final String button;


  @override
  Widget build(BuildContext context, {Color? buttonColor}) {
    result_writer controller = Get.find();

    answer controller2 = Get.find();

    dificultad controller3 = Get.find();

    progresion tempo = Get.find();


    int dia = controller3.difficultya;
    int dib = controller3.difficultyb;

    Color buttonColor = Colors.blue;
    if (button == "go") {
      buttonColor = Colors.orange; // Cambia el color del botón "=" a naranja
    }else if(button == "go") {
      buttonColor = Colors.red;
    }

    //funciones
    int n_val (String nombre) {
      if (nombre == "1") {
        return 1;
        } else if (nombre == "2") {
        return 2;
        } else if (nombre == "3") {
        return 3;
        } else if (nombre == "4") {
        return 4;
        } else if (nombre == "5") {
        return 5;
        } else if (nombre == "6") {
        return 6;
        } else if (nombre == "7") {
        return 7;
        } else if (nombre == "8") {
        return 8;
        } else if (nombre == "9") {
        return 9;
        }
      
      return 0;
    }

    



    void oprimido (String nombre) async {
      if (nombre == "C") {
        controller.reset();
      } else if (nombre == "go") {
        //fin
          if (controller.contador==6){
            tempo.terminar();
            Get.to(const end_page());
            //_logout();
          }
          await controller2.verificar(controller.result);
          
          controller.aumento();
          controller2.generar_q(dia,dib);
          controller.reset();
          print("hola");
        } else {
          int numero = n_val(nombre);
          controller.newdigit(numero);
      }
    }



    //estructura del boton
    return Container(
      width: 60.0,
      height: 60.0,

      

      child: ElevatedButton(
        onPressed: () {
          
          oprimido(button);
        },

        style: ElevatedButton.styleFrom(
          shape: const CircleBorder(),
          padding: const EdgeInsets.all(16.0),
          primary: buttonColor, // Establece el color del botón
        ),
        
        child: Text(
          button,
          style: const TextStyle(fontSize: 24.0),
        ),
      ),
    );

  }
}

//LISTO
