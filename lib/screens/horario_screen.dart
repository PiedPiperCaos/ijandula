import 'package:flutter/material.dart';
import 'package:ijandula/provider/alumnado_provider.dart';

class MenuHorarioScreen extends StatefulWidget {

  @override
  State<MenuHorarioScreen> createState() => _HorarioScreenState();
}

class _HorarioScreenState extends State<MenuHorarioScreen> {

  final int segundos = DateTime.now().second;
  
  
  @override
  Widget build(BuildContext context) {
    final nombre = ModalRoute.of(context)!.settings.arguments.toString();
    datos.busquedaHora(dia(), nombre);
  
    for(int i = 0; i < 10000; i++)
    {
      return Scaffold(
        body: Center(
          child: Container(
            child: 
                bucleDeBucle()
            ),
          ),
      );
    }
    return Container();
  }

  horas() {
    int hora = 0;

    if(DateTime.now().hour >= 8 && DateTime.now().hour < 9)
    {
        hora = 1;
    }
    else if(DateTime.now().hour >= 9 && DateTime.now().hour < 10)
    {
      setState(() {
        hora = 2;
      });
    }
    else if(DateTime.now().hour >= 10 && DateTime.now().hour < 11)
    {
        hora = 3;
    }
    else if(DateTime.now().hour >= 11 && DateTime.now().hour < 12)
    {
        hora = 4;
    }
    else if(DateTime.now().hour >= 12 && DateTime.now().hour < 13)
    {
        hora = 5;
    }
    else if(DateTime.now().hour >= 13 && DateTime.now().hour <= 14)
    {
        hora = 6;
    }
    else
    {
      hora = 0;
    }
    return hora;
  }

  dia() {
    int hora = horas();
    String dia = "";

    if(hora != 0)
    {
      if(DateTime.now().weekday == 1)
      {
        dia = "L$hora";
      }
      else if(DateTime.now().weekday == 2)
      {
        dia = "M$hora";
      }
      else if(DateTime.now().weekday == 3)
      {
        dia = "X$hora";
      }
      else if(DateTime.now().weekday == 4)
      {
        dia = "J$hora";
      }
      else if(DateTime.now().weekday == 5)
      {
        dia = "V$hora";
      }
      else
      {
        dia = "";
      }
    }
    else
    {
      dia == "";
    }
    return dia;
  }
  Widget _cursos(String dia, String nombre) {
    return FutureBuilder(
      future: datos.busquedaHora(dia, nombre),
      initialData: [],
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return ListView(
          children: _listaItems(snapshot.data, context),
        );
      },
    );
  }

  List<Widget> _listaItems(List<dynamic> data, BuildContext context) {
    final List<Widget> opciones = [];

    for (int i = 0; i < data.length; i++) {
      final widgetTemp = Text(data[i]);
      opciones
        ..add(widgetTemp)
        ..add(Divider());
    }
    ;
    return opciones;
  }

  Widget bucleDeBucle(){
    if(datos.horarioAlumno.length != 0)
    {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
            Text(datos.horarioAlumno[0]),
            Text(datos.horarioAlumno[1])
        ],
      );
    }
    return Container();
  }
}