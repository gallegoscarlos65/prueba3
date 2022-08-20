import '../config.dart';
import 'package:flutter/widgets.dart';

class Gastos with ChangeNotifier{
  String? concepto;
  double? cantidad;
  DateTime? fecha;
  Gastos({this.concepto, this.cantidad, this.fecha});

    void agregarCompra() {
    notifyListeners();
  }

  setGastos(String concepto, double cantidad, DateTime fecha){
    this.concepto = concepto;
    this.cantidad = cantidad;
    this.fecha = fecha;
  }
}
