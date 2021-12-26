import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:ijandula/provider/ProviderBano.dart';
import 'package:provider/provider.dart';

class Banoo extends StatefulWidget {
  @override
  State<Banoo> createState() => _BanooState();
}

String usuario = "";
String curso = "";
var entrada = new DateTime.now();
var salida = new DateTime.now();
String g = "";
String g2 = "";

class _BanooState extends State<Banoo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan,
      appBar: AppBar(
        title: Text('Menú Baño'),
        backgroundColor: Colors.lightGreen,
      ),
      body: Center(
        child: Container(
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: 200,
                ),
                Text(
                  'MENÚ DEL BAÑO',
                  style: TextStyle(
                      fontSize: 60,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic),
                ),
                SizedBox(
                  height: 30,
                ),
                RaisedButton(
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                    child: Text(
                      'Entrada/Salida',
                      style: TextStyle(fontSize: 40, color: Colors.blue[900]),
                    ),
                    onPressed: () {
                      setState(() {
                        Navigator.pushNamed(context, 'es');
                      });
                    }),
                SizedBox(
                  height: 20,
                ),
                RaisedButton(
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                    child: Text(
                      '     Informes     ',
                      style: TextStyle(fontSize: 40, color: Colors.blue[900]),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, 'informes');
                      setState(() {});
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class EntradaSalida extends StatelessWidget {
  TextStyle estilo =
      TextStyle(fontSize: 30, color: Colors.red, fontWeight: FontWeight.bold);

  @override
  Widget build(BuildContext context) {
    final cursosProvider = Provider.of<ProviderAlumnos>(context);
    final cursos = cursosProvider.alumnos;

    return Scaffold(
        appBar: AppBar(
          title: Text("Cursos Disponibles"),
        ),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.black,
          child: ListView.builder(
              itemCount: cursos.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                    onTap: () {
                      curso = cursos[index].curso;
                      Navigator.pushNamed(context, 'alumnos');
                    },
                    child: Column(
                      children: [
                        SizedBox(
                          height: 25,
                        ),
                        Text(
                          cursos[index].curso,
                          style: TextStyle(fontSize: 40, color: Colors.orange),
                        ),
                      ],
                    ));
              }),
        ));
  }
}

class Alumnos extends StatefulWidget {
  @override
  State<Alumnos> createState() => _AlumnosState();
}

class _AlumnosState extends State<Alumnos> {
  TextStyle estilo =
      TextStyle(fontSize: 30, color: Colors.red, fontWeight: FontWeight.bold);
  bool disable = false;
  Color color1 = Colors.grey;
  Color color2 = Colors.green;
  bool visibleR = false;
  bool visibleV = true;

  @override
  Widget build(BuildContext context) {
    final alumnosProvider = Provider.of<ProviderAlumnos>(context);
    final alumnos = alumnosProvider.alumnos;

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text("Alumnos"),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 12),
        color: Colors.black,
        child: ListView.builder(
            itemCount: alumnos.length,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                  onTap: () {
                    usuario = alumnos[index].nombre;
                    print(usuario);
                    Navigator.pushNamed(context, 'botones', arguments: usuario);
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (curso == alumnos[index].curso)
                        Center(
                          child: Column(
                            children: [
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                alumnos[index].nombre,
                                style: TextStyle(
                                    fontSize: 20, color: Colors.orange),
                              ),
                            ],
                          ),
                        )
                    ],
                  ));
            }),
      ),
    );
  }
}

class Botones extends StatefulWidget {
  @override
  State<Botones> createState() => _BotonesState();
}

class _BotonesState extends State<Botones> {
  bool visibleR = false;
  bool visibleV = true;

  @override
  Widget build(BuildContext context) {
    // final String nombre = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      floatingActionButton: botones(),
      appBar: AppBar(
        title: Text('Entrada y Salida del Baño'),
        centerTitle: true,
        backgroundColor: Colors.brown,
        automaticallyImplyLeading: false,
      ),
      body: Container(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 250),
              Text('Alumno',
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40,color: Colors.red),),
                Text('____________________________________________________________________________'),
              Text(
                usuario,
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget botones() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            if (visibleV == true)
              Text('Entrada',
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.green,
                      fontWeight: FontWeight.bold)),
            if (visibleR == true)
              Text('Salida',
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.red,
                      fontWeight: FontWeight.bold)),
            Verde(),
            Rojo()
          ],
        )
      ],
    );
  }

  Widget Verde() {
    return Visibility(
      visible: visibleV,
      child: FloatingActionButton(
        child: Icon(Icons.person_add_alt_1),
        backgroundColor: Colors.green,
        onPressed: () {
          setState(() {});
          visibleR = true;
          visibleV = false;

          g = ('${entrada.year}/${entrada.month}/${entrada.day} - ${entrada.hour}:${entrada.minute}:${entrada.second}');
        },
      ),
    );
  }

  Widget Rojo() {
    return Visibility(
      visible: visibleR,
      child: FloatingActionButton(
        child: Icon(Icons.person_remove),
        backgroundColor: Colors.red,
        onPressed: () {
          setState(() {});
          visibleR = false;
          visibleV = true;
          g2 =
              ('${entrada.year}/${entrada.month}/${entrada.day} - ${entrada.hour}:${entrada.minute}:${entrada.second}');
          Navigator.pop(context);
        },
      ),
    );
  }
}

class Informes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Informes',
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 25, color: Colors.black),
        ),
        backgroundColor: Colors.pink,
        centerTitle: true,
      ),
      body: Container(
        child: Column(
          children: [
            GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, 'alumnos_fecha');
                },
                child: Text('Ejemplo fecha'))
          ],
        ),
      ),
    );
  }
}

class AlumnosFecha extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Orden',
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 25, color: Colors.black),
        ),
        backgroundColor: Colors.pink,
        centerTitle: true,
      ),
      body: Container(
        child: Column(
          children: [
            GestureDetector(onTap: () {}, child: Text('Ejemplo Alumno'))
          ],
        ),
      ),
    );
  }
}
