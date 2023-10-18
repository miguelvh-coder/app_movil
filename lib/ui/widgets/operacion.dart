import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/answer.dart';

class operacion extends StatelessWidget {
  const operacion({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    answer controller = Get.find();



    return Container(
      color: Colors.amber,
      child:  Column(
        mainAxisAlignment: MainAxisAlignment
            .start, // Cambiamos de MainAxisAlignment.center a MainAxisAlignment.start
        children: [
          Padding(
            padding:const EdgeInsets.all(20.0), // Ajusta el espacio alrededor del textonull, // Cambia null por la función que debe ejecutarse cuando se presione el botón
            child: Obx(() {
              final aval = controller.a.toString();
              final bval = controller.b.toString();
              final oval = controller.oper.toString();

              return Text(
                '$aval $oval $bval', // Muestra el int convertido o un mensaje de error
                style: TextStyle(fontSize: 24.0), // Ajusta el tamaño de la fuente del texto
              );
            }),
          ),
        ],
      ),
    );
  }
}

