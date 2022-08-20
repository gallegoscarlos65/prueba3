import 'package:flutter/material.dart';
import 'package:gastos/config.dart';
import 'package:gastos/widgets/barritas.dart';
import 'package:intl/intl.dart';
import 'database/gastos.dart';
import 'database/semana.dart';
import 'widgets/bitacora.dart';
import 'widgets/format.dart';

class Run extends StatefulWidget {
  const Run({Key? key}) : super(key: key);

  @override
  State<Run> createState() => _RunState();
}

class _RunState extends State<Run> {
  final TextEditingController cantidadController = TextEditingController();
  final TextEditingController concepController = TextEditingController();
  final TextEditingController dateController = TextEditingController();

  void formaDatos() async {
    return await showModalBottomSheet(
        elevation: 5,
        isScrollControlled: true,
        context: context,
        builder: (_) => formaWidget());
  }



  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(onPressed: () => formaDatos(), icon: const Icon(Icons.add)),
          IconButton(
              onPressed: () => themach.cambiarTema(),
              icon: const Icon(Icons.dark_mode))
        ],
        title: const Text("Gastos"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              width: double.infinity,
              child: Barritas(),
            ),
            SizedBox(height: 500, width: double.infinity, child: Bitacora()),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () => formaDatos(), child: const Icon(Icons.add)),
    );
  }
}//end class
