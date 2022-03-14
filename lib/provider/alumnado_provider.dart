import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:ijandula/models/alumnos_response.dart';
import 'package:ijandula/models/cursos_response.dart';
import 'package:ijandula/models/horario_response.dart';

class AlumnadoProvider extends ChangeNotifier {
  List<DatosAlumnos> alumno = [];
  List<HorarioResult> horario = [];
  List<String> horarioAlumno = [];

  //hoja excel
  //https://docs.google.com/spreadsheets/d/1TUUhwPtc06E_Ka-TU_4XUiGOz-BZOEjdLvbxRAJQiMg/edit#gid=0

  //https://opensheet.vercel.app/1TUUhwPtc06E_Ka-TU_4XUiGOz-BZOEjdLvbxRAJQiMg/Cursos
  final _url = "opensheet.vercel.app";
  final _api = "1TUUhwPtc06E_Ka-TU_4XUiGOz-BZOEjdLvbxRAJQiMg";
  final _hojaCursos = "Cursos";

  //https://opensheet.vercel.app/1TUUhwPtc06E_Ka-TU_4XUiGOz-BZOEjdLvbxRAJQiMg/Datos_Alumnado
  final _hojaAlumnos = "Datos_Alumnado";

  //https://opensheet.vercel.app/1TUUhwPtc06E_Ka-TU_4XUiGOz-BZOEjdLvbxRAJQiMg/horarios
  final _hojaHorario = "Horarios";

  AlumnadoProvider() {
    print("Alumnado Provider inicalizado");
    getAlumno();
    getHorario();
  }

  Future<String> _getJsonData(String baseurl, String api, String pagina) async {
    var url = Uri.parse("https://" + baseurl + "/" + api + "/" + pagina);

    final response = await http.post(url);

    return response.body;
  }

  Future<List<String>> getCursos() async {
    String jsonData = await this._getJsonData(_url, _api, _hojaCursos);
    jsonData = '{"results":' + jsonData + '}';
    final nowPlayingRespose = Cursos.fromJson(jsonData);
    List<String> nombres = [];

    for (int i = 0; i < nowPlayingRespose.result.length; i++) {
      nombres.add(nowPlayingRespose.result[i].cursoNombre);
    }
    return nombres;
  }

  Future<List<dynamic>> getAlumnos(String cursoABuscarAlumnos) async {
    String jsonData = await this._getJsonData(_url, _api, _hojaAlumnos);
    jsonData = '{"results":' + jsonData + '}';
    final nowPlayingRespose = Alumnos.fromJson(jsonData);
    List<dynamic> nombresAlumnos = [];
    for (int i = 0; i < nowPlayingRespose.result.length; i++) {
      if (nowPlayingRespose.result[i].curso == cursoABuscarAlumnos)
        nombresAlumnos.add(nowPlayingRespose.result[i].nombre);
    }
    return nombresAlumnos;
  }

  getAlumno() async {
    String jsonData = await this._getJsonData(_url, _api, _hojaAlumnos);
    jsonData = '{"results":' + jsonData + '}';
    final nowPlayingRespose = Alumnos.fromJson(jsonData);
    alumno = nowPlayingRespose.result;
    notifyListeners();
  }

  getHorario() async {
    String jsonData = await this._getJsonData(_url, _api, _hojaHorario);
    jsonData = '{"results":' + jsonData + '}';
    final nowPlayingRespose = Horario.fromJson(jsonData);
    horario = nowPlayingRespose.result;
    notifyListeners();
  }
  Future<List<dynamic>> getAlumnoFuture() async {
    String jsonData = await this._getJsonData(_url, _api, _hojaAlumnos);
    jsonData = '{"results":' + jsonData + '}';
    final nowPlayingRespose = Alumnos.fromJson(jsonData);
    List<dynamic> nombresAlumnos = [];
    for (int i = 0; i < nowPlayingRespose.result.length; i++) {
      nombresAlumnos.add(nowPlayingRespose.result[i].nombre);
    }
    return nombresAlumnos;
  }
    Future<List<dynamic>> busquedaAlumnos(String query) async {
    List<DatosAlumnos> alumnoSeleccionado = [];
    String jsonData = await this._getJsonData(_url, _api, _hojaAlumnos);
    jsonData = '{"results":' + jsonData + '}';
    final nowPlayingRespose = Alumnos.fromJson(jsonData);
    for(int i = 0; i < nowPlayingRespose.result.length; i++)
    {
      if(nowPlayingRespose.result[i].nombre == query)
      {
        alumnoSeleccionado.add(nowPlayingRespose.result[i]);
      }
    }
    return alumnoSeleccionado;
  }

  busquedaHora(String dia, String nombre) async {
    String datosAlumnos = "";
    String jsonData = await this._getJsonData(_url, _api, _hojaHorario);
    jsonData = '{"results":' + jsonData + '}';
    final nowPlayingRespose = Horario.fromJson(jsonData);
    for(int i = 0; i < alumno.length; i++)
    {
      if(alumno[i].nombre == nombre)
      {
        datosAlumnos = alumno[i].curso;
      }
    }
    for(int i = 0; i < nowPlayingRespose.result.length; i++)
    {
      if(nowPlayingRespose.result[i].dia == dia && nowPlayingRespose.result[i].curso == datosAlumnos)
      {
        print(nowPlayingRespose.result[i].asignatura);
        horarioAlumno.add(nowPlayingRespose.result[i].asignatura);
        horarioAlumno.add(nowPlayingRespose.result[i].aulas);
      }
    }
  }
}

final datos = new AlumnadoProvider();
