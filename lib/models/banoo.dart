import 'dart:convert';

class Login {
    Login({
      required this.result,
    });

    List<Result> result;

    factory Login.fromJson(String str) => Login.fromMap(json.decode(str));

    factory Login.fromMap(Map<String, dynamic> json) => Login(
        result: List<Result>.from(json["result"].map((x) => Result.fromMap(x))),
    );

}

class Result {
    Result({
      required  this.alumno,
      required  this.fecha,
      required  this.veces,
    });

    String alumno;
    String fecha;
    String veces;

    factory Result.fromJson(String str) => Result.fromMap(json.decode(str));

    factory Result.fromMap(Map<String, dynamic> json) => Result(
        alumno: json["alumno"],
        fecha: json["fecha"],
        veces: json["veces"],
    );

}
