import 'package:flutter/material.dart';
import 'package:gastos/config.dart';

class formaWidget extends StatefulWidget {
  formaWidget({Key? key}) : super(key: key);

  @override
  State<formaWidget> createState() => _formaWidgetState();
}

class _formaWidgetState extends State<formaWidget> {





  
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}





Container formatoRegistro(
    TextEditingController concepController,
    TextEditingController cantidadController,
    TextEditingController dateController,
    BuildContext context,
    Function agregar) {
  return Container(
    padding: EdgeInsets.only(
        left: 10,
        right: 10,
        top: 10,
        bottom: 50 + MediaQuery.of(context).viewInsets.bottom),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        TextField(
          controller: concepController,
          decoration: const InputDecoration(hintText: "Concepto:"),
        ),
        const SizedBox(
          height: 10,
        ),
        TextField(
          controller: cantidadController,
          decoration: const InputDecoration(hintText: "Cantidad"),
        ),
        const SizedBox(
          height: 10,
        ),
        GestureDetector(
          onTap: () {
            showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(DateTime.now().year - 100),
                    lastDate: DateTime(DateTime.now().year + 1))
                .then((value) {
              if ((value!.day.toInt() < 10) && (value.month.toInt() >= 10)) {
                dateController.text =
                    '${value.year.toString()}-${value.month.toString()}-0${value.day.toString()}';
              } else if ((value.day.toInt() >= 10) &&
                  (value.month.toInt() < 10)) {
                dateController.text =
                    '${value.year.toString()}-0${value.month.toString()}-${value.day.toString()}';
              } else if ((value.day.toInt() < 10) &&
                  (value.month.toInt() < 10)) {
                dateController.text =
                    '${value.year.toString()}-0${value.month.toString()}-0${value.day.toString()}';
              } else {
                dateController.text =
                    '${value.year.toString()}-${value.month.toString()}-${value.day.toString()}';
              }
            });
          },
          child: TextField(
            controller: dateController,
            decoration: const InputDecoration(hintText: "Fecha"),
            enabled: false,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        ElevatedButton(
            onPressed: () {
              
              
              agregar();
            },
            child: const Text("Guardar")),
      ],
    ),
  );
}

Container menuDesplegable(BuildContext context, int indice, Function eliminar, Function editar) {
  final TextEditingController cantidadController = TextEditingController();
  final TextEditingController concepController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  void formaDatos(int indice) async {
    return await showModalBottomSheet(
        elevation: 5,
        isScrollControlled: true,
        context: context,
        builder: (_) => formatoEdit(concepController, cantidadController,
            dateController, context, indice, editar));
  }

  return Container(
    padding: EdgeInsets.only(
        left: 10,
        right: 10,
        top: 10,
        bottom: 50 + MediaQuery.of(context).viewInsets.bottom),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        ElevatedButton(
            onPressed: () {
              eliminar(indice);
            },
            child: const Icon(Icons.delete)),
        const SizedBox(
          height: 10,
        ),
        ElevatedButton(
            onPressed: (){
              formaDatos(indice);
            },
            child: const Icon(Icons.edit)),
      ],
    ),
  );
}

Container formatoEdit(
    TextEditingController concepController,
    TextEditingController cantidadController,
    TextEditingController dateController,
    BuildContext context, int indice, Function editar) {
  return Container(
    padding: EdgeInsets.only(
        left: 10,
        right: 10,
        top: 10,
        bottom: 50 + MediaQuery.of(context).viewInsets.bottom),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        TextField(
          controller: concepController,
          decoration: const InputDecoration(hintText: "Concepto:"),
        ),
        const SizedBox(
          height: 10,
        ),
        TextField(
          controller: cantidadController,
          decoration: const InputDecoration(hintText: "Cantidad"),
        ),
        const SizedBox(
          height: 10,
        ),
        GestureDetector(
          onTap: () {
            showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(DateTime.now().year - 100),
                    lastDate: DateTime(DateTime.now().year + 1))
                .then((value) {
              if ((value!.day.toInt() < 10) && (value.month.toInt() >= 10)) {
                dateController.text =
                    '${value.year.toString()}-${value.month.toString()}-0${value.day.toString()}';
              } else if ((value.day.toInt() >= 10) &&
                  (value.month.toInt() < 10)) {
                dateController.text =
                    '${value.year.toString()}-0${value.month.toString()}-${value.day.toString()}';
              } else if ((value.day.toInt() < 10) &&
                  (value.month.toInt() < 10)) {
                dateController.text =
                    '${value.year.toString()}-0${value.month.toString()}-0${value.day.toString()}';
              } else {
                dateController.text =
                    '${value.year.toString()}-${value.month.toString()}-${value.day.toString()}';
              }
            });
          },
          child: TextField(
            controller: dateController,
            decoration: const InputDecoration(hintText: "Fecha"),
            enabled: false,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        ElevatedButton(
            onPressed: () {
              editar(indice, cantidadController, concepController, dateController);
            },
            child: const Text("Guardar")),
      ],
    ),
  );
  
}


