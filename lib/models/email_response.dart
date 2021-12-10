// To parse this JSON data, do
//
//     final emailResponse = emailResponseFromMap(jsonString);

import 'dart:convert';

class EmailResponse {
    EmailResponse({
        required this.results,
    });

    List<ResultEmail> results;

    factory EmailResponse.fromJson(String str) => EmailResponse.fromMap(json.decode(str));

    factory EmailResponse.fromMap(Map<String, dynamic> json) => EmailResponse(
        results: List<ResultEmail>.from(json["results"].map((x) => ResultEmail.fromMap(x))),
    );
}

class ResultEmail {
    ResultEmail({
        required this.id,
        required this.email,
    });

    String id;
    String email;

    factory ResultEmail.fromJson(String str) => ResultEmail.fromMap(json.decode(str));

    factory ResultEmail.fromMap(Map<String, dynamic> json) => ResultEmail(
        id: json["ID"],
        email: json["EMAIL"],
    );
}
