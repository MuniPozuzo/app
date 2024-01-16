// To parse this JSON data, do
//
//     final stations = stationsFromJson(jsonString);

import 'dart:convert';

Stations stationsFromJson(String str) => Stations.fromJson(json.decode(str));

String stationsToJson(Stations data) => json.encode(data.toJson());

class Stations {
  bool status;
  String message;
  List<Datum> data;

  Stations({
    required this.status,
    required this.message,
    required this.data,
  });

  factory Stations.fromJson(Map<String, dynamic> json) => Stations(
        status: json["status"],
        message: json["message"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  String ide_estacion;
  String cod_ubigeo;
  String des_localidad;
  String tip_estacion;
  String des_canal;
  String des_frecuencia;
  String des_banda_satelital;
  String des_antenas_tv;
  String des_antenas_fm;
  String est_torre;
/*   double num_latitud;
  double num_longitud; */
  String des_recomendacion;
  String des_conclusiones;
  String est_estacion;

  Datum({
    required this.ide_estacion,
    required this.cod_ubigeo,
    required this.des_localidad,
    required this.tip_estacion,
    required this.des_canal,
    required this.des_frecuencia,
    required this.des_banda_satelital,
    required this.des_antenas_tv,
    required this.des_antenas_fm,
    required this.est_torre,
/*     required this.num_latitud,
    required this.num_longitud, */
    required this.des_recomendacion,
    required this.des_conclusiones,
    required this.est_estacion,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        ide_estacion: json["IDE_ESTACION"],
        cod_ubigeo: json["COD_UBIGEO"],
        des_localidad: json["DES_LOCALIDAD"],
        tip_estacion: json["TIP_ESTACION"],
        des_canal: json["DES_CANAL"],
        des_frecuencia: json["DES_FRECUENCIA"],
        des_banda_satelital: json["DES_BANDA_SATELITAL"],
        des_antenas_tv: json["DES_ANTENAS_TV"],
        des_antenas_fm: json["DES_ANTENAS_FM"],
        est_torre: json["EST_TORRE"],
        /*    num_latitud: json["NUM_LATITUD"],
        num_longitud: json["NUM_LONGITUD"], */
        des_recomendacion: json["DES_RECOMENDACION"],
        des_conclusiones: json["DES_CONCLUSIONES"],
        est_estacion: json["EST_ESTACION"],
      );

  Map<String, dynamic> toJson() => {
        "IDE_ESTACION": ide_estacion,
        "COD_UBIGEO": cod_ubigeo,
        "DES_LOCALIDAD": des_localidad,
        "TIP_ESTACION": tip_estacion,
        "DES_CANAL": des_canal,
        "DES_FRECUENCIA": des_frecuencia,
        "DES_BANDA_SATELITAL": des_banda_satelital,
        "DES_ANTENAS_TV": des_antenas_tv,
        "DES_ANTENAS_FM": des_antenas_fm,
        "EST_TORRE": est_torre,
/*         "NUM_LATITUD": num_latitud,
        "NUM_LONGITUD": num_longitud, */
        "DES_OBSERVACION": des_recomendacion,
        "DES_CONCLUSIONES": des_conclusiones,
        "EST_ESTACION": est_estacion,
      };
}

class ImgFoto {
  String type;
  List<int> data;

  ImgFoto({
    required this.type,
    required this.data,
  });

  factory ImgFoto.fromJson(Map<String, dynamic> json) => ImgFoto(
        type: json["type"],
        data: List<int>.from(json["data"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "data": List<dynamic>.from(data.map((x) => x)),
      };
}
