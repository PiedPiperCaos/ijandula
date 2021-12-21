import 'package:flutter/material.dart';
import 'package:ijandula/models/alumnos_response.dart';
import 'package:ijandula/provider/alumnado_provider.dart';

class SearchDeletegate extends SearchDelegate{

  Widget containerVacio() {
    return Container(
      child: Center(
        child: Text("no se ha encontrado alumno"),
      ),
    );
  }

  @override
  String get searchFieldLabel => "buscar alumno";
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
      onPressed: () => query = '',
      icon: Icon(Icons.clear))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
    onPressed: (){
      close(context, null);
    },
    icon: Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    return Text("");
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if(query.isEmpty){
      return Container(
        child: Center(
          child: Text("usuario no encontrado"),
        ),
      );
    }


    return FutureBuilder(
      future: datos.busquedaAlumnos(query),
      builder: ( _ , AsyncSnapshot<List<dynamic>> snapshot) {

        if(!snapshot.hasData) return containerVacio();

        final alumnos = snapshot.data!;
        return ListView.builder(
          itemBuilder: (_, int index) => AlumnoItem(alumnos[index], query),
          itemCount: alumnos.length,
        );
      },
    );
  }
  
}

class AlumnoItem extends StatelessWidget {

  final DatosAlumnos alumno;

  final String nombre;

  const AlumnoItem(this.alumno, this.nombre);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(alumno.nombre),
      onTap: () => Navigator.pushNamed(context, "menu_horario", arguments: nombre)
    );
  }
}