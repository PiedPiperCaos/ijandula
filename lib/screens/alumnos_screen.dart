import 'package:flutter/material.dart';
import 'package:ijandula/provider/alumnado_provider.dart';

class AlumnosScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final curso = ModalRoute.of(context)!.settings.arguments.toString();
    return Scaffold(
      appBar:
          AppBar(title: Center(child: Text("Listado de Alumnos " + "$curso"))),
      body: _alumnos(curso),
    );
  }

  Widget _alumnos(String curso) {
    return FutureBuilder(
      future: datos.getAlumnos(curso),
      initialData: [],
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return ListView(
          children: _listaItems(snapshot.data, context, curso),
        );
      },
    );
  }

  List<Widget> _listaItems(
      List<dynamic> data, BuildContext context, String curso) {
    final List<Widget> opciones = [];

    for (int i = 0; i < data.length; i++) {
      final widgetTemp = ListTile(
        title: Text(data[i].toString()),
        trailing: Icon(Icons.keyboard_arrow_right),
        onTap: () {
          List<dynamic> argumentos = [];
          argumentos.add(data[i]);
          argumentos.add(curso);
          Navigator.pushNamed(context, 'datos_alumnos', arguments: argumentos);
        },
      );
      opciones
        ..add(widgetTemp)
        ..add(Divider());
    }
    ;
    return opciones;
  }
}
