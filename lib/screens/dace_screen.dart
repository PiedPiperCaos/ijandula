import 'package:flutter/material.dart';
import 'package:ijandula/provider/dace_provider.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.Dart';

class DaceScreen extends StatefulWidget {
  const DaceScreen({Key? key}) : super(key: key);

  @override
  State<DaceScreen> createState() => _DaceScreenState();
}

class _DaceScreenState extends State<DaceScreen> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("Actividades Extraescolares"),
      ),
      body: _lista()
    );
  }

  Widget _lista() {

    final resultadosDace = Provider.of<DaceProvider>(context);
  
    return ListView.builder(
      itemCount: resultadosDace.resultados.length,
      itemBuilder: (BuildContext context, int index) {
        
          return Column(
            children: [
              GestureDetector(
                onTap: (){
                  _launchURL(resultadosDace.resultados[index].alumnos); //Enlace a documento con listado de alumnos
                },
                child: ListTile(
                  leading: Icon(Icons.add, color: Colors.blue),
                  title: Text(resultadosDace.resultados[index].actividad),
                  trailing: Text(resultadosDace.resultados[index].fechaInicio),
                ),
              ),
              Divider()
            ],
          );

      },
    );
  }
  
  _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}

