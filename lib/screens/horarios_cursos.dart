import 'package:flutter/material.dart';
import 'package:ijandula/models/horario_response.dart';
import 'package:ijandula/provider/alumnado_provider.dart';

class HorariosCursosScreen extends StatelessWidget {
  List<HorarioResult> listaAlumnos = [];

  @override
  Widget build(BuildContext context) {
    String curso = ModalRoute.of(context)!.settings.arguments.toString();
    var textStyle = TextStyle(fontSize: 25, fontWeight: FontWeight.bold);

    horarioCurso(curso);
    return Scaffold(
      appBar: AppBar(
        title: Text("Horario " + curso),
      ),
      body: Container(
          child: ListView(
        children: [
          Column(
            children: [
              Row(
                children: [
                  SizedBox(width: 50),
                  Text("Dia", style: textStyle),
                  SizedBox(width: 50),
                  Text("Asignatura", style: textStyle),
                  SizedBox(width: 50),
                  Text("Aula", style: textStyle),
                ],
              ),
              Row(
                children: [
                  SizedBox(width: 50),
                  Column(children: listaHorariosDia()),
                  SizedBox(width: 50),
                  Column(children: listaHorariosAsignatura()),
                  SizedBox(width: 40),
                  Column(children: listaHorariosAula()),
                  SizedBox(height: 40),
                ],
              ),
            ],
          ),
        ],
      )),
    );
  }

  List<Widget> listaHorariosDia() {
    List<Widget> lista = [];
    for (int i = 0; i < listaAlumnos.length; i++) {
      var textStyle = TextStyle(fontSize: 20);
      Widget container = Container(
          child: Column(
        children: [
          Row(
            children: [
              Text(listaAlumnos[i].dia, style: textStyle),
            ],
          )
        ],
      ));
      lista.add(container);
    }
    return lista;
  }

  List<Widget> listaHorariosAsignatura() {
    List<Widget> lista = [];
    for (int i = 0; i < listaAlumnos.length; i++) {
      var textStyle = TextStyle(fontSize: 20);
      Widget container = Container(
          child: Column(
        children: [
          Row(
            children: [
              Text(listaAlumnos[i].asignatura, style: textStyle),
            ],
          )
        ],
      ));
      lista.add(container);
    }
    return lista;
  }

  List<Widget> listaHorariosAula() {
    List<Widget> lista = [];
    for (int i = 0; i < listaAlumnos.length; i++) {
      var textStyle = TextStyle(fontSize: 20);
      Widget container = Container(
          child: Column(
        children: [
          Row(
            children: [
              Text(listaAlumnos[i].aulas, style: textStyle),
            ],
          )
        ],
      ));
      lista.add(container);
    }
    return lista;
  }

  horarioCurso(String curso) {
    for (int i = 0; i < datos.horario.length; i++) {
      if (datos.horario[i].curso == curso) {
        listaAlumnos.add(datos.horario[i]);
      }
    }
  }
}
