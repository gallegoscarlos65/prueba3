import 'package:flutter/material.dart';
import 'package:gastos/config.dart';
import 'package:intl/intl.dart';
import 'format.dart';

class Bitacora extends StatefulWidget {
  Bitacora({Key? key}) : super(key: key);

  @override
  State<Bitacora> createState() => _BitacoraState();
}

class _BitacoraState extends State<Bitacora> {
  final TextEditingController cantidadController = TextEditingController();
  final TextEditingController concepController = TextEditingController();
  final TextEditingController dateController = TextEditingController();

  Widget cargarImagen() => Card(
        elevation: 5,
        child: Image.asset("assets/images/waiting.png"),
      );

  void _eliminarGastos(int index){
    setState(() {
      eliminarGastos(index);
      //rellenar();
    });
    Navigator.pop(context);
  }
  void _editarGastos(int lugar, TextEditingController cantidad, TextEditingController concepto, TextEditingController date){
    setState(() {
      editarGastos(lugar, cantidad, concepto, date);
    });
    Navigator.pop(context);
    Navigator.pop(context);
    cantidad.clear();
    concepto.clear();
    date.clear();
  }

  @override
  Widget build(BuildContext context) {
    void formaDatos(int indice) async {
    return await showModalBottomSheet (
        elevation: 5,
        isScrollControlled: true,
        context: context,
        builder: (_) => menuDesplegable(context, indice, _eliminarGastos, _editarGastos)
        );
      }
    return losgastos.isEmpty
        ? cargarImagen()
        : ListView.builder(
            itemCount: losgastos.length,
            itemBuilder: (context, indice) => Container(
              child: ElevatedButton(
                onPressed: () {
                },
                onLongPress: (){
                  formaDatos(indice);
                },
                // ignore: sort_child_properties_last
                child: Column(
                  children: <Widget>[
                    ListTile(
                        title: Text(losgastos[indice].concepto!),
                        subtitle: Text(DateFormat('yy/MM/dd')
                            .format(losgastos[indice].fecha!)),
                        leading:
                            Text("\$ ${losgastos[indice].cantidad.toString()}"))
                    ],
                  ),
                style: ButtonStyle(backgroundColor: MaterialStateProperty.resolveWith((states) => Colors.white)),
              ),
            ),
    );
  }
}

