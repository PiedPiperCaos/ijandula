import 'dart:convert';

class Alumn {
    Alumn({
      required  this.result,
    });

    List<Result2> result;

    factory Alumn.fromJson(String str) => Alumn.fromMap(json.decode(str));

    factory Alumn.fromMap(Map<String, dynamic> json) => Alumn(
        result: List<Result2>.from(json["results"].map((x) => Result2.fromMap(x))),
    );
}

class Result2 {
    Result2({
      required  this.nombre,
      required  this.curso,
      required  this.email,
      required  this.telefonoAlumno,
      required  this.telefonoPadre,
      required  this.telefonoMadre,
    });

    String nombre;
    String curso;
    String email;
    String telefonoAlumno;
    String telefonoPadre;
    String telefonoMadre;

    factory Result2.fromJson(String str) => Result2.fromMap(json.decode(str));

    factory Result2.fromMap(Map<String, dynamic> json) => Result2(
        nombre: json["nombre"],
        curso: json["curso"],
        email: json["email"],
        telefonoAlumno: json["telefonoAlumno"],
        telefonoPadre: json["telefonoPadre"],
        telefonoMadre: json["telefonoMadre"],
    );
}
