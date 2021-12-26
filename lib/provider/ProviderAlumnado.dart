import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:ijandula/models/Alumnado.dart';


class ProviderAlumnos extends ChangeNotifier {

  String _apiKey = '1TUUhwPtc06E_Ka-TU_4XUiGOz-BZOEjdLvbxRAJQiMg';
  String _baseUrl = 'opensheet.vercel.app';
  String _nombreDeLaHoja = 'Datos_Alumnado';

  List<Result2> alumnos = [];

  ProviderAlumnos(){
    print("Iniciado Datos Alumno");
    this.getOnDisplay();
  }

  Future <String> _getJsonData() async{
    final url = Uri.https(_baseUrl,_apiKey+'/'+_nombreDeLaHoja);
    final response = await http.get(url);
    return response.body;
  }

   getOnDisplay()async{
     String jsonData = await this._getJsonData();
     jsonData = '{"results":'+jsonData+"}";
     final login = Alumn.fromJson(jsonData);
     alumnos = [...login.result];
     notifyListeners();
   }
}