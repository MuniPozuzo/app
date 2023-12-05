// To parse this JSON data, do
//
//     final inspection = inspectionFromJson(jsonString);

import 'dart:convert';

Inspection inspectionFromJson(String str) =>
    Inspection.fromJson(json.decode(str));

String inspectionToJson(Inspection data) => json.encode(data.toJson());

class Inspection {
  bool status;
  List<InspectionElement> inspection;

  Inspection({
    required this.status,
    required this.inspection,
  });

  factory Inspection.fromJson(Map<String, dynamic> json) => Inspection(
        status: json["status"],
        inspection: json["inspection"] != null
            ? List<InspectionElement>.from(
                json["inspection"].map((x) => InspectionElement.fromJson(x)),
              )
            : [],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "inspection": List<dynamic>.from(inspection.map((x) => x.toJson())),
      };
}

class InspectionElement {
  String id;
  String tv;
  String modulador;
  String radiofm;
  String transmisor;
  String antenatv;
  String antenafm;
  String receptorsatelital;
  String antenaparabolica;
  String pozotierra;
  String pararrayos;
  String long;
  String lat;
  String image;
  String fecha;
  String comentarios;
  String image2;
  int idUsuario;

  InspectionElement({
    required this.id,
    required this.tv,
    required this.modulador,
    required this.radiofm,
    required this.transmisor,
    required this.antenatv,
    required this.antenafm,
    required this.receptorsatelital,
    required this.antenaparabolica,
    required this.pozotierra,
    required this.pararrayos,
    required this.long,
    required this.lat,
    required this.image,
    required this.fecha,
    required this.comentarios,
    required this.image2,
    required this.idUsuario,
  });

  factory InspectionElement.fromJson(Map<String, dynamic> json) =>
      InspectionElement(
        id: json["id"],
        tv: json["tv"],
        modulador: json["modulador"],
        radiofm: json["radiofm"],
        transmisor: json["transmisor"],
        antenatv: json["antenatv"],
        antenafm: json["antenafm"],
        receptorsatelital: json["receptorsatelital"],
        antenaparabolica: json["antenaparabolica"],
        pozotierra: json["pozotierra"],
        pararrayos: json["pararrayos"],
        long: json["long"],
        lat: json["lat"],
        image: json["image"],
        fecha: json["fecha"],
        comentarios: json["comentarios"],
        image2: json["image2"],
        idUsuario: json["idUsuario"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "tv": tv,
        "modulador": modulador,
        "radiofm": radiofm,
        "transmisor": transmisor,
        "antenatv": antenatv,
        "antenafm": antenafm,
        "receptorsatelital": receptorsatelital,
        "antenaparabolica": antenaparabolica,
        "pozotierra": pozotierra,
        "pararrayos": pararrayos,
        "long": long,
        "lat": lat,
        "image": image,
        "fecha": fecha,
        "comentarios": comentarios,
        "image2": image2,
        "idUsuario": idUsuario,
      };
}
