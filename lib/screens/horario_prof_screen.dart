import 'package:flutter/material.dart';
import 'package:ijandula/provider/centro_provider.dart';
import 'package:provider/provider.dart';

final tramosHorarios = [
  [2, 22, 42, 62, 82],
  [4, 24, 44, 64, 84],
  [6, 26, 46, 66, 86],
  [9, 29, 49, 69, 89],
  [11, 31, 51, 71, 91],
  [13, 33, 53, 73, 93]
];

class HorarioProfScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final index = ModalRoute.of(context)!.settings.arguments as int;
    final centroProvider = Provider.of<CentroProvider>(context, listen: false);
    final listadoProfesores = centroProvider.listaProfesores;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "HORARIO DE ${listadoProfesores[index].nombre} ",
          style: TextStyle(fontSize: 16),
        ),
      ),
      body: Container(
          decoration: BoxDecoration(color: Colors.blue),
          child: Table(
            border: TableBorder.all(),
            children: [
              DiasSemana(),
              DiaHorario(context, centroProvider, index, tramosHorarios[0]),
              DiaHorario(context, centroProvider, index, tramosHorarios[1]),
              DiaHorario(context, centroProvider, index, tramosHorarios[2]),
              DiaHorario(context, centroProvider, index, tramosHorarios[3]),
              DiaHorario(context, centroProvider, index, tramosHorarios[4]),
              DiaHorario(context, centroProvider, index, tramosHorarios[5]),
            ],
          )),
    );
  }

  TableRow DiasSemana() {
    return TableRow(children: [
      Container(),
      Container(
          child: Text(
        "L",
        textAlign: TextAlign.center,
      )),
      Container(child: Text("M", textAlign: TextAlign.center)),
      Container(child: Text("X", textAlign: TextAlign.center)),
      Container(child: Text("J", textAlign: TextAlign.center)),
      Container(child: Text("V", textAlign: TextAlign.center)),
      Container(),
      Container()
    ]);
  }

  TableRow DiaHorario(BuildContext context, CentroProvider centroProvider,
      int index, List<int> tramosHorarios) {
    return TableRow(children: [
      devolverHorarios(context, centroProvider, index, 0),
      devolverClase(context, centroProvider, index, tramosHorarios[0]),
      devolverClase(context, centroProvider, index, tramosHorarios[1]),
      devolverClase(context, centroProvider, index, tramosHorarios[2]),
      devolverClase(context, centroProvider, index, tramosHorarios[3]),
      devolverClase(context, centroProvider, index, tramosHorarios[4]),
    ]);
  }
}

Widget devolverHorarios(
    BuildContext context, CentroProvider centroProvider, int index, int nFila) {
  final listadoTramos = centroProvider.listaTramos;
  final listadoHorarioProfesores = centroProvider.listaHorariosProfesores;
  List<String> horario = [
    "8:15 a 9:15",
    "9:15 a 10:15",
    "10:15 a 11:15",
    "11:45 a 12:45",
    "12:45 a 13:45",
    "13:45 a 14:45"
  ];

  return Container(
    child: Text(horario[nFila]),
  );
}

Widget devolverClase(
    BuildContext context, CentroProvider centroProvider, int index, int hora) {
  final listadoAulas = centroProvider.listaAulas;
  final listadoAsignaturas = centroProvider.listaAsignaturas;
  final nuestroHorario = _averiguarHorario(context, index, hora);

  String asignatura = "";
  String aula = "";

  for (int i = 0; i < listadoAulas.length; i++) {
    if (int.parse(nuestroHorario[1]) == int.parse(listadoAulas[i].numIntAu)) {
      aula = listadoAulas[i].abreviatura;
    }
  }

  for (int i = 0; i < listadoAsignaturas.length; i++) {
    if (int.parse(nuestroHorario[0]) ==
        int.parse(listadoAsignaturas[i].numIntAs)) {
      asignatura = listadoAsignaturas[i].abreviatura;
    }
  }

  return Container(
    child: Column(children: [Text(asignatura), Text(aula)]),
  );
}

List<String> _averiguarHorario(BuildContext context, int id_prof, int tramo) {
  final centroProvider = Provider.of<CentroProvider>(context, listen: false);
  final listadoHorariosProfesores = centroProvider.listaHorariosProfesores;
  List<String> horario = List.filled(2, "0");

  for (int i = 0; i < listadoHorariosProfesores.length; i++) {
    if (int.parse(listadoHorariosProfesores[i].horNumIntPr) == id_prof + 1) {
      for (int j = 0; j < listadoHorariosProfesores[i].actividad.length; j++) {
        if (int.parse(listadoHorariosProfesores[i].actividad[j].tramo) ==
            tramo) {
          horario[0] = listadoHorariosProfesores[i].actividad[j].asignatura;

          horario[1] = listadoHorariosProfesores[i].actividad[j].aula;

          print("Asignatura: " + horario[0]);
          print("Aula: " + horario[1]);
        }
      }
    }
  }

  return horario;
}
