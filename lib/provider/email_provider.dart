import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:seneca/models/email_response.dart';

class EmailProvider extends ChangeNotifier {

  List<ResultEmail> resultados = [];

  EmailProvider(){ 
    print("EmailProvider inicializado");
    this.getEmailData();
  }

  Future<String> _getJsonData() async{
    
    final url = Uri.parse('https://opensheet.vercel.app/149zzcYE1utXnOeawKTjh2p7bFuPNNb8nL3xcXVInRcg/2');

    // Await the http get response, then decode the json-formatted respo
    final response = await http.get(url);

    return response.body;
  }

  getEmailData() async{
    
    final jsonData = await this._getJsonData();
   
    final emailData = EmailResponse.fromJson('{"results":'+jsonData+'}');

    resultados = emailData.results;
    //print(resultados);
    notifyListeners();  
  }
  
}