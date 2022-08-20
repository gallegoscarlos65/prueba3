library config.globals;
import 'package:flutter/material.dart';
import 'package:gastos/database/gastos.dart';
import 'package:gastos/widgets/mitema.dart';

import 'database/semana.dart';

ThemeData temaPersonal = ThemeData(
  primarySwatch: Colors.purple,
  textTheme: const TextTheme(
      headline1: TextStyle(fontSize: 11),
      bodyText1: TextStyle(fontStyle: FontStyle.italic)),
);
List<Gastos> losgastos = [];

var largo = losgastos.length;

int losGastos(){
  return losgastos.length;
}

editarGastos(int lugar, TextEditingController cantidad, TextEditingController concepto, TextEditingController date){
  losgastos[lugar].cantidad = double.parse(cantidad.text);
  losgastos[lugar].concepto = concepto.text;
  losgastos[lugar].fecha = DateTime.parse(date.text.toString());
}

eliminarGastos(int lugar){
  losgastos.removeAt(lugar);
}

List<Semana> semana = [];

MiTema themach = MiTema();
