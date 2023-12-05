// To parse this JSON data, do
//
//     final inspection = inspectionFromJson(jsonString);

import 'dart:convert';

Inspection_estacion inspectionFromJson(String str) =>
    Inspection_estacion.fromJson(json.decode(str));

String inspectionToJson(Inspection_estacion data) => json.encode(data.toJson());

class Inspection_estacion {
  bool status;
  List<InspectionElement> inspection;

  Inspection_estacion({
    required this.status,
    required this.inspection,
  });

  factory Inspection_estacion.fromJson(Map<String, dynamic> json) =>
      Inspection_estacion(
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
  String ide_estacion;
  String ide_proyecto;
  String cod_cpacc;
  String tip_torre;
  String num_torre_altura;
  String tip_pozo_tierra;
  String num_impedancia;
  String est_pozo_tierra;
  String tip_pararrayos;
  String tip_cobre_desnudo;
  String est_pararrayos;
  String num_latitud;
  String num_longitud;
  String num_altitud;
  String est_tx_television;
  String est_modulador_tv;
  String est_radio_fm;
  String est_transmisor_hf;
  String est_antena_tv;
  String est_antena_fm;
  String est_receptor_satelital;
  String est_antena_parabolica;
  String des_observacion;
  String img_foto1;
  String img_foto2;
  String est_estacion;
  String userInsert;
  String fechaInsert;
  String userUpdate;
  String fechaUpdate;

  InspectionElement({
    required this.ide_estacion,
    required this.ide_proyecto,
    required this.cod_cpacc,
    required this.tip_torre,
    required this.num_torre_altura,
    required this.tip_pozo_tierra,
    required this.num_impedancia,
    required this.est_pozo_tierra,
    required this.tip_pararrayos,
    required this.tip_cobre_desnudo,
    required this.est_pararrayos,
    required this.num_latitud,
    required this.num_longitud,
    required this.num_altitud,
    required this.est_tx_television,
    required this.est_modulador_tv,
    required this.est_radio_fm,
    required this.est_transmisor_hf,
    required this.est_antena_tv,
    required this.est_antena_fm,
    required this.est_receptor_satelital,
    required this.est_antena_parabolica,
    required this.des_observacion,
    required this.img_foto1,
    required this.img_foto2,
    required this.est_estacion,
    required this.userInsert,
    required this.fechaInsert,
    required this.userUpdate,
    required this.fechaUpdate,
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
