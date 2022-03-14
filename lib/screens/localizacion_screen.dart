import 'package:flutter/material.dart';
import 'package:ijandula/provider/alumnado_provider.dart';
import 'package:ijandula/screens/search_delegate.dart';

class LocalizacionScreen extends StatefulWidget {

  @override
  State<LocalizacionScreen> createState() => _LocalizacionScreenState();
}

class _LocalizacionScreenState extends State<LocalizacionScreen> {

  String nombreAlumno = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              icon: Icon(Icons.search_outlined),
              onPressed: () => showSearch(context: context, delegate: SearchDeletegate(),),
            )
          ],
        ),
        body: _alumnos()
        );
  }
}

  Widget _alumnos() {
  return FutureBuilder(
    future: datos.getAlumnoFuture(),
    initialData: [],
    builder: (BuildContext context, AsyncSnapshot snapshot) {
      return ListView(
        children: _listaItems(snapshot.data, context),
      );
    },
  );
  }
  List<Widget> _listaItems(
    List<dynamic> data, BuildContext context) {
  final List<Widget> opciones = [];

  for (int i = 0; i < data.length; i++) {
    final widgetTemp = ListTile(
      title: Text(data[i].toString()),
      onTap: () => Navigator.pushNamed(context, "menu_horario", arguments: data[i])
    );
    opciones
      ..add(widgetTemp)
      ..add(Divider());
  }
  ;
  return opciones;
  }