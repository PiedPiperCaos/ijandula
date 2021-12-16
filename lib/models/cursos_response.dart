// To parse this JSON data, do
//
//     final logear = logearFromMap(jsonString);

import 'dart:convert';

class Cursos {
  Cursos({
    required this.result,
  });

  List<Curso> result;

  factory Cursos.fromJson(String str) => Cursos.fromMap(json.decode(str));

  factory Cursos.fromMap(Map<String, dynamic> json) => Cursos(
        result: List<Curso>.from(json["result"].map((x) => Curso.fromMap(x))),
      );
}

class Curso {
  Curso({
    required this.id,
    required this.cursoNombre,
  });

  String id;
  String cursoNombre;

  factory Curso.fromJson(String str) => Curso.fromMap(json.decode(str));

  factory Curso.fromMap(Map<String, dynamic> json) => Curso(
        id: json["Id"],
        cursoNombre: json["Curso"],
      );
}
