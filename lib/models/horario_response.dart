import 'dart:convert';

class Horario {
  Horario({
    required this.result,
  });

  List<HorarioResult> result;

  factory Horario.fromJson(String str) => Horario.fromMap(json.decode(str));

  factory Horario.fromMap(Map<String, dynamic> json) => Horario(
        result: List<HorarioResult>.from(
            json["result"].map((x) => HorarioResult.fromMap(x))),
      );
}

class HorarioResult {
  HorarioResult({
    required this.curso,
    required this.dia,
    required this.hora,
    required this.asignatura,
    required this.aulas,
  });

  String curso;
  String dia;
  String hora;
  String asignatura;
  String aulas;

  factory HorarioResult.fromJson(String str) =>
      HorarioResult.fromMap(json.decode(str));

  factory HorarioResult.fromMap(Map<String, dynamic> json) => HorarioResult(
        curso: json["Curso"],
        dia: json["Dia"],
        hora: json["Hora"],
        asignatura: json["Asignatura"],
        aulas: json["Aulas"],
      );
}
