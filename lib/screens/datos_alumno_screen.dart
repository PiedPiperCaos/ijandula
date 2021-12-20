import 'package:flutter/material.dart';
import 'package:ijandula/provider/alumnado_provider.dart';

import 'package:url_launcher/url_launcher.Dart' as UrlLauncher;

class DatosAlumnoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String argumentos = ModalRoute.of(context)!.settings.arguments.toString();
    argumentos = argumentos.replaceAll("[", "");
    argumentos = argumentos.replaceAll("]", "");
    final lista = argumentos.split(",");
    String nombre = ("${lista[0]}," + lista[1]);
    int indice = -1;

    for (int i = 0; i < datos.alumno.length; i++) {
      if (nombre.trim() == datos.alumno[i].nombre.trim() &&
          lista[2].trim() == datos.alumno[i].curso.trim()) {
        indice = i;
      }
    }

    final alumno = datos.alumno[indice];

    var textStyle = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 23,
    );
    var textStyle2 = TextStyle(fontWeight: FontWeight.normal, fontSize: 20);
    return Scaffold(
      appBar: AppBar(title: Center(child: Text(nombre))),
      body: Container(
        margin: EdgeInsets.only(top: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Correo del alumno:", style: textStyle),
            GestureDetector(
                onTap: () => UrlLauncher.launch('mailto:${alumno.email}'),
                child: Text(alumno.email, style: textStyle2)),
            Divider(),
            Text("Numero del alumno:", style: textStyle),
            GestureDetector(
                onTap: () =>
                    UrlLauncher.launch("tel://${alumno.telefonoAlumno}"),
                child: Text(alumno.telefonoAlumno, style: textStyle2)),
            Divider(),
            Text("Numero del padre:", style: textStyle),
            GestureDetector(
                onTap: () =>
                    UrlLauncher.launch("tel://${alumno.telefonoPadre}"),
                child: Text(alumno.telefonoPadre, style: textStyle2)),
            Divider(),
            Text("Numero de la madre:", style: textStyle),
            GestureDetector(
                onTap: () =>
                    UrlLauncher.launch("tel://${alumno.telefonoMadre}"),
                child: Text(alumno.telefonoMadre, style: textStyle2)),
          ],
        ),
      ),
    );
  }
}
