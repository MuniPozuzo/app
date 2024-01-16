import 'package:appproyecto2/constants/urls.dart';
import 'package:appproyecto2/home/Listar_Estaciones.dart';
import 'package:appproyecto2/widgets/Alert.dart';
// ignore_for_file: file_names

import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
// ignore: implementation_imports

List<DropdownMenuItem<String>> get dropdownTXTelevision {
  List<DropdownMenuItem<String>> txTVItems = const [
    DropdownMenuItem(child: Text("Seleccione"), value: ""),
    DropdownMenuItem(child: Text("Averiado"), value: "Averiado"),
    DropdownMenuItem(child: Text("Operativo"), value: "Operativo"),
    DropdownMenuItem(child: Text("Inexistente"), value: "Inexistente"),
    DropdownMenuItem(child: Text("Inoperativo"), value: "Inoperativo"),
    DropdownMenuItem(child: Text("Retirado"), value: "Retirado"),
    DropdownMenuItem(child: Text("Regular"), value: "Regular"),
    DropdownMenuItem(child: Text("Por Registrar"), value: "Por Registrar"),
  ];
  return txTVItems;
}

List<DropdownMenuItem<String>> get dropdownModuladorTV {
  List<DropdownMenuItem<String>> moduladorTVItems = const [
    DropdownMenuItem(child: Text("Seleccione"), value: ""),
    DropdownMenuItem(child: Text("Averiado"), value: "Averiado"),
    DropdownMenuItem(child: Text("Operativo"), value: "Operativo"),
    DropdownMenuItem(child: Text("Inexistente"), value: "Inexistente"),
    DropdownMenuItem(child: Text("Inoperativo"), value: "Inoperativo"),
    DropdownMenuItem(child: Text("Retirado"), value: "Retirado"),
    DropdownMenuItem(child: Text("Regular"), value: "Regular"),
    DropdownMenuItem(child: Text("Por Registrar"), value: "Por Registrar"),
  ];
  return moduladorTVItems;
}

List<DropdownMenuItem<String>> get dropdownRadioFM {
  List<DropdownMenuItem<String>> radioFMItems = const [
    DropdownMenuItem(child: Text("Seleccione"), value: ""),
    DropdownMenuItem(child: Text("Averiado"), value: "Averiado"),
    DropdownMenuItem(child: Text("Operativo"), value: "Operativo"),
    DropdownMenuItem(child: Text("Inexistente"), value: "Inexistente"),
    DropdownMenuItem(child: Text("Inoperativo"), value: "Inoperativo"),
    DropdownMenuItem(child: Text("Retirado"), value: "Retirado"),
    DropdownMenuItem(child: Text("Regular"), value: "Regular"),
    DropdownMenuItem(child: Text("Por Registrar"), value: "Por Registrar"),
  ];
  return radioFMItems;
}

List<DropdownMenuItem<String>> get dropdownTransmisorHF {
  List<DropdownMenuItem<String>> transmisorHFItems = const [
    DropdownMenuItem(child: Text("Seleccione"), value: ""),
    DropdownMenuItem(child: Text("Averiado"), value: "Averiado"),
    DropdownMenuItem(child: Text("Operativo"), value: "Operativo"),
    DropdownMenuItem(child: Text("Inexistente"), value: "Inexistente"),
    DropdownMenuItem(child: Text("Inoperativo"), value: "Inoperativo"),
    DropdownMenuItem(child: Text("Retirado"), value: "Retirado"),
    DropdownMenuItem(child: Text("Regular"), value: "Regular"),
    DropdownMenuItem(child: Text("Por Registrar"), value: "Por Registrar"),
  ];
  return transmisorHFItems;
}

List<DropdownMenuItem<String>> get dropdownAntenaTV {
  List<DropdownMenuItem<String>> antenaTVItems = const [
    DropdownMenuItem(child: Text("Seleccione"), value: ""),
    DropdownMenuItem(child: Text("Averiado"), value: "Averiado"),
    DropdownMenuItem(child: Text("Operativo"), value: "Operativo"),
    DropdownMenuItem(child: Text("Inexistente"), value: "Inexistente"),
    DropdownMenuItem(child: Text("Inoperativo"), value: "Inoperativo"),
    DropdownMenuItem(child: Text("Retirado"), value: "Retirado"),
    DropdownMenuItem(child: Text("Regular"), value: "Regular"),
    DropdownMenuItem(child: Text("Por Registrar"), value: "Por Registrar"),
  ];
  return antenaTVItems;
}

List<DropdownMenuItem<String>> get dropdownAntenaFM {
  List<DropdownMenuItem<String>> antenaFMItems = const [
    DropdownMenuItem(child: Text("Seleccione"), value: ""),
    DropdownMenuItem(child: Text("Averiado"), value: "Averiado"),
    DropdownMenuItem(child: Text("Operativo"), value: "Operativo"),
    DropdownMenuItem(child: Text("Inexistente"), value: "Inexistente"),
    DropdownMenuItem(child: Text("Inoperativo"), value: "Inoperativo"),
    DropdownMenuItem(child: Text("Retirado"), value: "Retirado"),
    DropdownMenuItem(child: Text("Regular"), value: "Regular"),
    DropdownMenuItem(child: Text("Por Registrar"), value: "Por Registrar"),
  ];
  return antenaFMItems;
}

List<DropdownMenuItem<String>> get dropdownreceptorSatelital {
  List<DropdownMenuItem<String>> receptorsatelitalItems = const [
    DropdownMenuItem(child: Text("Seleccione"), value: ""),
    DropdownMenuItem(child: Text("Averiado"), value: "Averiado"),
    DropdownMenuItem(child: Text("Operativo"), value: "Operativo"),
    DropdownMenuItem(child: Text("Inexistente"), value: "Inexistente"),
    DropdownMenuItem(child: Text("Inoperativo"), value: "Inoperativo"),
    DropdownMenuItem(child: Text("Retirado"), value: "Retirado"),
    DropdownMenuItem(child: Text("Regular"), value: "Regular"),
    DropdownMenuItem(child: Text("Por Registrar"), value: "Por Registrar"),
  ];
  return receptorsatelitalItems;
}

List<DropdownMenuItem<String>> get dropdownAntenaParabolica {
  List<DropdownMenuItem<String>> antenaprabolicaItems = const [
    DropdownMenuItem(child: Text("Seleccione"), value: ""),
    DropdownMenuItem(child: Text("Averiado"), value: "Averiado"),
    DropdownMenuItem(child: Text("Operativo"), value: "Operativo"),
    DropdownMenuItem(child: Text("Inexistente"), value: "Inexistente"),
    DropdownMenuItem(child: Text("Inoperativo"), value: "Inoperativo"),
    DropdownMenuItem(child: Text("Retirado"), value: "Retirado"),
    DropdownMenuItem(child: Text("Regular"), value: "Regular"),
    DropdownMenuItem(child: Text("Por Registrar"), value: "Por Registrar"),
  ];
  return antenaprabolicaItems;
}

List<DropdownMenuItem<String>> get dropdownPozoTierra {
  List<DropdownMenuItem<String>> pozotierraItems = const [
    DropdownMenuItem(child: Text("Seleccione"), value: ""),
    DropdownMenuItem(child: Text("Averiado"), value: "Averiado"),
    DropdownMenuItem(child: Text("Operativo"), value: "Operativo"),
    DropdownMenuItem(child: Text("Inexistente"), value: "Inexistente"),
    DropdownMenuItem(child: Text("Inoperativo"), value: "Inoperativo"),
    DropdownMenuItem(child: Text("Retirado"), value: "Retirado"),
    DropdownMenuItem(child: Text("Regular"), value: "Regular"),
    DropdownMenuItem(child: Text("Por Registrar"), value: "Por Registrar"),
  ];
  return pozotierraItems;
}

List<DropdownMenuItem<String>> get dropdownParaRayos {
  List<DropdownMenuItem<String>> pararayosItems = const [
    DropdownMenuItem(child: Text("Seleccione"), value: ""),
    DropdownMenuItem(child: Text("Averiado"), value: "Averiado"),
    DropdownMenuItem(child: Text("Operativo"), value: "Operativo"),
    DropdownMenuItem(child: Text("Inexistente"), value: "Inexistente"),
    DropdownMenuItem(child: Text("Inoperativo"), value: "Inoperativo"),
    DropdownMenuItem(child: Text("Retirado"), value: "Retirado"),
    DropdownMenuItem(child: Text("Regular"), value: "Regular"),
    DropdownMenuItem(child: Text("Por Registrar"), value: "Por Registrar"),
  ];
  return pararayosItems;
}

class Registro_Isnpeccion extends StatefulWidget {
  final String id;
  final String deslocalidad2;
  Registro_Isnpeccion(
      {super.key, required this.id, required this.deslocalidad2});
  @override
  _Registro_IsnpeccionState createState() => _Registro_IsnpeccionState();
}

class _Registro_IsnpeccionState extends State<Registro_Isnpeccion> {
// Loading para ver el tiempo de carga y validar si tuvo exito la peticion o no
  bool isLoading = false;

  //Donde se guarda la imagen que se tome
  String base64image = "";
  String base64image2 = "";
//Coordenadas
  bool servicestatus = false;
  bool haspermission = false;
  late LocationPermission permission;
  late Position position;

/*   String long = "", lat = ""; */
  late StreamSubscription<Position> positionStream;
  DateTime now = new DateTime.now();

  TextEditingController textEditingController = TextEditingController();
  TextEditingController textEditingController2 = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String ide_estacion = "";
  String nombre_estacion = "";
  String des_recomendacion = "";
  String des_conclusiones = "";
  DateTime fec_inspeccion = DateTime.now();
  String num_longitud = "";
  String num_latitud = "";
  String selectedValueTV = '';
  String selectedValueModuladorTV = '';
  String selectedValueRadioFM = '';
  String selectedValueTransmisorHF = '';
  String selectedValueAntenaTV = '';
  String selectedValueAntenaFM = '';
  String selectedValueReceptorSatelital = '';
  String selectedValueAntenaParabolica = '';
  String selectedValuePozoTierra = '';
  String selectedValueParaRayos = '';

  @override
  String handleChangeComents(String value) {
    setState(() {
      des_recomendacion = value;
    });

    return des_recomendacion;
  }

  String handleChangeComents2(String value) {
    setState(() {
      des_conclusiones = value;
    });

    return des_conclusiones;
  }

  void clearForm() {
    setState(() {
      selectedValueTV = '';
      ide_estacion = '';
      des_recomendacion = "";
      des_conclusiones = "";
      textEditingController.clear();
      textEditingController2.clear();
      fec_inspeccion = DateTime.now();
      num_longitud = "";
      num_latitud = "";
      selectedValueModuladorTV = '';
      selectedValueRadioFM = '';
      selectedValueTransmisorHF = '';
      selectedValueAntenaTV = '';
      selectedValueAntenaFM = '';
      selectedValueReceptorSatelital = '';
      selectedValueAntenaParabolica = '';
      selectedValuePozoTierra = '';
      selectedValueParaRayos = '';
      base64image = "";
      base64image2 = "";
      nombre_estacion = "";
    });
  }

/*   @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  } */

  void initState() {
    checkGps();
    super.initState();
  }

//Esto es para que podamos acceder ala camara y cuando tome la foto
// convertirla en base64
  void uploadImage() async {
    //se hace una instancia de la liberia para poder usar todas sus funciones
    ImagePicker picker = ImagePicker();
    //donde dice ImageSource podemos colocar .camera o .gallery, para acceder a galeria o a ala camara
    final pickerFile = await picker.pickImage(source: ImageSource.camera);

    //aca solo es validacion, de que si tomo imagen o no
    if (pickerFile != null) {
      final imageBytes = await pickerFile.readAsBytes();
      setState(() {
        //El base64Encode es para convertir los datos de la imagen en base 64 nada mas
        //se ponde dentro del setState para que la variable base64image sea lo de   base64Encode(imageBytes);
        base64image = base64Encode(imageBytes);
      });
    } else {
      //No hacer nada en dado caso el usuario le de al boton de atras
      return;
    }
  }

  void uploadImage2() async {
    //se hace una instancia de la liberia para poder usar todas sus funciones
    ImagePicker picker2 = ImagePicker();
    //donde dice ImageSource podemos colocar .camera o .gallery, para acceder a galeria o a ala camara
    final pickerFile2 = await picker2.pickImage(source: ImageSource.camera);

    //aca solo es validacion, de que si tomo imagen o no
    if (pickerFile2 != null) {
      final imageBytes2 = await pickerFile2.readAsBytes();
      setState(() {
        //El base64Encode es para convertir los datos de la imagen en base 64 nada mas
        //se ponde dentro del setState para que la variable base64image sea lo de   base64Encode(imageBytes);
        base64image2 = base64Encode(imageBytes2);
      });
    } else {
      //No hacer nada en dado caso el usuario le de al boton de atras
      return;
    }
  }

// TODO: Request permission
  checkGPS<bool>() async {
    final isActive = await Geolocator.isLocationServiceEnabled();
    print('permission----------------------$isActive');
    return isActive;
  }

  Future _getPositions() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // return Future.error('Location services are disabled.');
      return 'Location services are disabled.';
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // return Future.error('Location permissions are denied');
        return 'Location permissions are denied';
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // return Future.error(
      //     'Location permissions are permanently denied, we cannot request permissions.');
      return 'Location permissions are permanently denied, we cannot request permissions.';
    }

    return await checkGps();
  }

  checkGps() async {
    servicestatus = await Geolocator.isLocationServiceEnabled();
    if (servicestatus) {
      permission = await Geolocator.checkPermission();

      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          print('Se deniegan los permisos de ubicación');
        } else if (permission == LocationPermission.deniedForever) {
          print("'Los permisos de ubicación se deniegan permanentemente");
        } else {
          haspermission = true;
        }
      } else {
        haspermission = true;
      }

      if (haspermission) {
        setState(() {
          //refresh the UI
        });

        getLocation();
      }
    } else {
      // Geolocator();
      print("El servicio GPS no está habilitado, active la ubicación GPS");
    }

    setState(() {
      //refresh the UI
    });
  }

  getLocation() async {
    position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    print(position.longitude); //Output: 80.24599079
    print(position.latitude); //Output: 29.6593457

    num_longitud = position.longitude.toString();
    num_latitud = position.latitude.toString();

    setState(() {
      //refresh UI
    });

    LocationSettings locationSettings = LocationSettings(
      accuracy: LocationAccuracy.high, //accuracy of the location data
      distanceFilter: 100, //minimum distance (measured in meters) a
      //device must move horizontally before an update event is generated;
    );

    StreamSubscription<Position> positionStream =
        Geolocator.getPositionStream(locationSettings: locationSettings)
            .listen((Position position) {
      print(position.longitude); //Output: 80.24599079
      print(position.latitude); //Output: 29.6593457

      num_longitud = position.longitude.toString();
      num_latitud = position.latitude.toString();

      setState(() {
        //refresh UI on update
      });
    });
  }

  Future<bool> _guardarDatos(
      ide_estacion,
      nombre_estacion,
      est_tx_television,
      est_modulador_tv,
      est_radio_fm,
      est_transmisor_hf,
      est_antena_tv,
      est_antena_fm,
      est_receptor_satelital,
      est_antena_parabolica,
      est_pozo_tierra,
      est_pararrayos,
      img_foto1,
      num_longitud,
      num_latitud,
      fec_inspeccion,
      des_recomendacion,
      des_conclusiones,
      img_foto2,
      id_usuario) async {
    var url = '';
    if (isLocal) {
      // url = 'http://181.176.161.129:8080/app/apiv1/project/add';
      //url = 'http://181.176.161.129:8080/apiv1/project/add';
      url = '$UrlApiLocal/project/add';
    } else {
      url = 'http://181.176.161.129:8080/app/apiv1/project/add';
    }
    var body = {
      'ide_estacion': widget.id,
      'nombre_estacion': widget.deslocalidad2,
      'est_tx_television': est_tx_television,
      'est_modulador_tv': est_modulador_tv,
      'est_radio_fm': est_radio_fm,
      'est_transmisor_hf': est_transmisor_hf,
      'est_antena_tv': est_antena_tv,
      'est_antena_fm': est_antena_fm,
      'est_receptor_satelital': est_receptor_satelital,
      'est_antena_parabolica': est_antena_parabolica,
      'est_pozo_tierra': est_pozo_tierra,
      'est_pararrayos': est_pararrayos,
      'img_foto1': img_foto1,
      'num_longitud': position.longitude.toString(),
      'num_latitud': position.latitude.toString(),
      'fec_inspeccion': fec_inspeccion = DateTime.now().toIso8601String(),
      'des_recomendacion': des_recomendacion,
      'des_conclusiones': des_conclusiones,
      'img_foto2': img_foto2,
      'id_usuario': id_usuario
    };
    final bodyDecode = json.encode(body);
    setState(() {
      isLoading = true;
    });
    var response = await http.post(
      /*      Uri.parse('http://10.0.2.2:3001/apiv1/project/add'), */
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: bodyDecode,
    );

    if (response.statusCode == 200) {
      setState(() {
        isLoading = false;
      });
      return true;
    } else {
      setState(() {
        isLoading = false;
      });
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
/*     DateTime now = DateTime.now();
    final formattedDate = "${now.day}-${now.month}-${now.year}"; */
    /*     String formattedDate = DateFormat('yyyy-MM-dd').format(now);  */
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'INSPECCIÓN TÉCNICA \n${widget.deslocalidad2}',
        ),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      width: double.infinity,
                      // color: Colors.grey,
                      child: Text(
                        'Fecha de Inspección:${now.year}-${now.month}-${now.day} ${now.hour}:${now.minute}:${now.second}',
                        /*   String formattedDate = DateFormat('yyyy-MM-dd – kk:mm').format(now) 

                         "${now.day}-${now.month}-${now.year}",  */
                      ),
                    ),

                    Container(
                      alignment: Alignment.centerLeft,
                      width: double.infinity,
                      // color: Colors.grey,
                      child: Text(
                        "Latitude: $num_latitud",
                        style: TextStyle(fontSize: 14),
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      width: double.infinity,
                      // color: Colors.grey,
                      child: Text("Longitude: $num_longitud",
                          style: TextStyle(fontSize: 14)),
                    ),

                    Container(
                      alignment: Alignment.centerLeft,
                      width: double.infinity,
                      height: 20,
                      // color: Colors.grey,
                    ),

                    Container(
                      alignment: Alignment.centerLeft,
                      width: double.infinity,
                      // color: Colors.grey,
                      child: Text(
                        'Seleccione un estado:',
                      ),
                    ),

                    Container(
                      alignment: Alignment.center,
                      width: double.infinity,
                      // color: Colors.grey,
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          'TX TELEVISIÓN',
                        ),
                        //MyDropDowButton()
                        DropdownButton(
                            items: dropdownTXTelevision,
                            value: selectedValueTV,
                            hint: const Text("Seleccione"),
                            onChanged: (value) {
                              setState(() {
                                selectedValueTV = value.toString();
                              });
                            })
                      ],
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          'MODULADOR TV',
                        ),
                        //MyDropDowButton()
                        DropdownButton(
                            items: dropdownModuladorTV,
                            value: selectedValueModuladorTV,
                            hint: const Text("Seleccione"),
                            onChanged: (value) {
                              setState(() {
                                selectedValueModuladorTV = value.toString();
                              });
                            })
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          'TX RADIO FM',
                        ),
                        //MyDropDowButton()
                        DropdownButton(
                            items: dropdownRadioFM,
                            value: selectedValueRadioFM,
                            hint: const Text("Seleccione"),
                            onChanged: (value) {
                              setState(() {
                                selectedValueRadioFM = value.toString();
                              });
                            })
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          'TRANSMISOR HF',
                        ),
                        //MyDropDowButton()
                        DropdownButton(
                            items: dropdownTransmisorHF,
                            value: selectedValueTransmisorHF,
                            hint: const Text("Seleccione"),
                            onChanged: (value) {
                              setState(() {
                                selectedValueTransmisorHF = value.toString();
                              });
                            })
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          'ANTENA TV',
                        ),
                        //MyDropDowButton()
                        DropdownButton(
                            items: dropdownAntenaTV,
                            value: selectedValueAntenaTV,
                            hint: const Text("Seleccione"),
                            onChanged: (value) {
                              setState(() {
                                selectedValueAntenaTV = value.toString();
                              });
                            })
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          'ANTENA FM',
                        ),
                        //MyDropDowButton()
                        DropdownButton(
                            items: dropdownAntenaFM,
                            value: selectedValueAntenaFM,
                            hint: const Text("Seleccione"),
                            onChanged: (value) {
                              setState(() {
                                selectedValueAntenaFM = value.toString();
                              });
                            })
                      ],
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          'RECEPTOR SATELITAL',
                        ),
                        //MyDropDowButton()
                        DropdownButton(
                            items: dropdownreceptorSatelital,
                            value: selectedValueReceptorSatelital,
                            hint: const Text("Seleccione"),
                            onChanged: (value) {
                              setState(() {
                                selectedValueReceptorSatelital =
                                    value.toString();
                              });
                            })
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          'ANTENA PARABÓLICA',
                        ),
                        //MyDropDowButton()
                        DropdownButton(
                            items: dropdownAntenaParabolica,
                            value: selectedValueAntenaParabolica,
                            hint: const Text("Seleccione"),
                            onChanged: (value) {
                              setState(() {
                                selectedValueAntenaParabolica =
                                    value.toString();
                              });
                            })
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          'POZO A TIERRA',
                        ),
                        //MyDropDowButton()
                        DropdownButton(
                            items: dropdownPozoTierra,
                            value: selectedValuePozoTierra,
                            hint: const Text("Seleccione"),
                            onChanged: (value) {
                              setState(() {
                                selectedValuePozoTierra = value.toString();
                              });
                            })
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          'PARA RRAYOS',
                        ),
                        //MyDropDowButton()
                        DropdownButton(
                            items: dropdownParaRayos,
                            value: selectedValueParaRayos,
                            hint: const Text("Seleccione"),
                            onChanged: (value) {
                              setState(() {
                                selectedValueParaRayos = value.toString();
                              });
                            })
                      ],
                    ),

                    Container(
                      alignment: Alignment.centerLeft,
                      width: double.infinity,
                      // color: Colors.grey,
                      child: TextField(
                        maxLength: 240,
                        controller: textEditingController,
                        decoration: InputDecoration(
                          labelText: 'Ingrese Recomendación',
                        ),
                        onChanged: (value) => handleChangeComents(value),
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      width: double.infinity,
                      // color: Colors.grey,
                      child: TextField(
                        maxLength: 240,
                        controller: textEditingController2,
                        decoration: InputDecoration(
                          labelText: 'Ingrese Conclusiones',
                        ),
                        onChanged: (value) => handleChangeComents2(value),
                      ),
                    ),

                    Container(
                      alignment: Alignment.center,
                      width: double.infinity,
                      height: 8,
                      // color: Colors.grey,
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [],
                      ),
                    ),
                    // Boton de guardar

                    Container(
                        alignment: Alignment.center,
                        width: double.infinity,
                        // color: Colors.grey,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            const Text('Tomar Foto'),
                            const SizedBox(
                              width: 10,
                            ),
                            Container(
                              width: 100,
                              height: 100,
                              decoration: BoxDecoration(
                                color: Colors.grey[200],
                                borderRadius: BorderRadius.circular(100),
                              ),
                              child: Center(
                                child: TextButton(
                                  onPressed: () {
                                    uploadImage();
                                  },
                                  child: base64image.isNotEmpty
                                      ? ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(100),
                                          child: Image.memory(
                                            base64Decode(base64image),
                                            width: 200,
                                            height: 200,
                                            fit: BoxFit.cover,
                                          ),
                                        )
                                      : const Text('Foto'),
                                ),
                              ),
                            ),
                            Container(
                              width: 100,
                              height: 100,
                              decoration: BoxDecoration(
                                color: Colors.grey[200],
                                borderRadius: BorderRadius.circular(100),
                              ),
                              child: Center(
                                child: TextButton(
                                  onPressed: () {
                                    uploadImage2();
                                  },
                                  child: base64image2.isNotEmpty
                                      ? ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(100),
                                          child: Image.memory(
                                            base64Decode(base64image2),
                                            width: 200,
                                            height: 200,
                                            fit: BoxFit.cover,
                                          ),
                                        )
                                      : const Text('Foto'),
                                ),
                              ),
                            ),
                          ],
                        )),
                    const SizedBox(height: 40.0, width: 30),

                    ElevatedButton(
                      onPressed: () async {
                        // bool active = await checkGPS();
                        final resReq = await _getPositions();
                        print('per----------------------------------$resReq');
                        // if (!active) {
                        //   showDialog(
                        //       context: context,
                        //       builder: (context) => AlertCustomDialog(
                        //           message: 'Activa tu ubicacion'));
                        //   return;
                        // }
                        // await checkGps();

                        if (selectedValueTV.isEmpty) {
                          showDialog<String>(
                            context: context,
                            builder: (BuildContext context) => AlertDialog(
                              title: const Text('Alerta'),
                              content: const Text(
                                  'Seleccione Estado de TX Televisión'),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () => Navigator.pop(context, 'OK'),
                                  child: const Text('OK'),
                                ),
                              ],
                            ),
                          );
                        } else if (selectedValueModuladorTV.isEmpty) {
                          showDialog<String>(
                            context: context,
                            builder: (BuildContext context) => AlertDialog(
                              title: const Text('Alerta'),
                              content: const Text(
                                  'Seleccione Estado de Modulador TV'),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () => Navigator.pop(context, 'OK'),
                                  child: const Text('OK'),
                                ),
                              ],
                            ),
                          );
                        } else if (selectedValueRadioFM.isEmpty) {
                          showDialog<String>(
                            context: context,
                            builder: (BuildContext context) => AlertDialog(
                              title: const Text('Alerta'),
                              content: const Text('Seleccione Estado de Radio'),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () => Navigator.pop(context, 'OK'),
                                  child: const Text('OK'),
                                ),
                              ],
                            ),
                          );
                        } else if (selectedValueTransmisorHF.isEmpty) {
                          showDialog<String>(
                            context: context,
                            builder: (BuildContext context) => AlertDialog(
                              title: const Text('Alerta'),
                              content: const Text(
                                  'Seleccione Estado de Transmisor HF'),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () => Navigator.pop(context, 'OK'),
                                  child: const Text('OK'),
                                ),
                              ],
                            ),
                          );
                        } else if (selectedValueAntenaTV.isEmpty) {
                          showDialog<String>(
                            context: context,
                            builder: (BuildContext context) => AlertDialog(
                              title: const Text('Alerta'),
                              content:
                                  const Text('Seleccione Estado de Antena TV'),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () => Navigator.pop(context, 'OK'),
                                  child: const Text('OK'),
                                ),
                              ],
                            ),
                          );
                        } else if (selectedValueAntenaFM.isEmpty) {
                          showDialog<String>(
                            context: context,
                            builder: (BuildContext context) => AlertDialog(
                              title: const Text('Alerta'),
                              content:
                                  const Text('Seleccione Estado de Antena FM'),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () => Navigator.pop(context, 'OK'),
                                  child: const Text('OK'),
                                ),
                              ],
                            ),
                          );
                        } else if (selectedValueReceptorSatelital.isEmpty) {
                          showDialog<String>(
                            context: context,
                            builder: (BuildContext context) => AlertDialog(
                              title: const Text('Alerta'),
                              content: const Text(
                                  'Seleccione Estado de Receptor Satelital'),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () => Navigator.pop(context, 'OK'),
                                  child: const Text('OK'),
                                ),
                              ],
                            ),
                          );
                        } else if (selectedValueAntenaParabolica.isEmpty) {
                          showDialog<String>(
                            context: context,
                            builder: (BuildContext context) => AlertDialog(
                              title: const Text('Alerta'),
                              content: const Text(
                                  'Seleccione Estado de Receptor Antena Parabólica'),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () => Navigator.pop(context, 'OK'),
                                  child: const Text('OK'),
                                ),
                              ],
                            ),
                          );
                        } else if (selectedValuePozoTierra.isEmpty) {
                          showDialog<String>(
                            context: context,
                            builder: (BuildContext context) => AlertDialog(
                              title: const Text('Alerta'),
                              content: const Text(
                                  'Seleccione Estado de Pozo a Tierra'),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () => Navigator.pop(context, 'OK'),
                                  child: const Text('OK'),
                                ),
                              ],
                            ),
                          );
                        } else if (selectedValueParaRayos.isEmpty) {
                          showDialog<String>(
                            context: context,
                            builder: (BuildContext context) => AlertDialog(
                              title: const Text('Alerta'),
                              content:
                                  const Text('Seleccione Estado de Pararrayos'),
                              actions: <Widget>[
                                /* TextButton(
                                  onPressed: () =>
                                      Navigator.pop(context, 'Cancel'),
                                  child: const Text('Cancel'),
                                ), */
                                TextButton(
                                  onPressed: () => Navigator.pop(context, 'OK'),
                                  child: const Text('OK'),
                                ),
                              ],
                            ),
                          );
                        } else if (des_recomendacion.isEmpty) {
                          showDialog<String>(
                            context: context,
                            builder: (BuildContext context) => AlertDialog(
                              title: const Text('Alerta'),
                              content: const Text('Ingrese una recomendación'),
                              actions: <Widget>[
                                /*  TextButton(
                                  onPressed: () =>
                                      Navigator.pop(context, 'Cancel'),
                                  child: const Text('Cancel'),
                                ), */
                                TextButton(
                                  onPressed: () => Navigator.pop(context, 'OK'),
                                  child: const Text('OK'),
                                ),
                              ],
                            ),
                          );
                        } else if (des_conclusiones.isEmpty) {
                          showDialog<String>(
                            context: context,
                            builder: (BuildContext context) => AlertDialog(
                              title: const Text('Alerta'),
                              content: const Text('Ingrese una conclusión'),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () => Navigator.pop(context, 'OK'),
                                  child: const Text('OK'),
                                ),
                              ],
                            ),
                          );
                        } else {
                          if (base64image.isEmpty) {
                            //Aca se puede mostrar un alerta
                            showDialog<String>(
                              context: context,
                              builder: (BuildContext context) => AlertDialog(
                                title: const Text('Alerta'),
                                content:
                                    const Text('Toma evidencias, fotografia'),
                                actions: <Widget>[
                                  /* TextButton(
                                    onPressed: () =>
                                        Navigator.pop(context, 'Cancel'),
                                    child: const Text('Cancel'),
                                  ), */
                                  TextButton(
                                    onPressed: () =>
                                        Navigator.pop(context, 'OK'),
                                    child: const Text('OK'),
                                  ),
                                ],
                              ),
                            );
                          } else {
                            SharedPreferences prefs =
                                await SharedPreferences.getInstance();
                            final iduser = prefs.getString('id');
                            final res = await _guardarDatos(
                                ide_estacion,
                                nombre_estacion,
                                selectedValueTV,
                                selectedValueModuladorTV,
                                selectedValueRadioFM,
                                selectedValueTransmisorHF,
                                selectedValueAntenaTV,
                                selectedValueAntenaFM,
                                selectedValueReceptorSatelital,
                                selectedValueAntenaParabolica,
                                selectedValuePozoTierra,
                                selectedValueParaRayos,
                                base64image,
                                num_longitud,
                                num_latitud,
                                fec_inspeccion,
                                des_recomendacion,
                                des_conclusiones,
                                base64image2,
                                iduser);
                            if (res == true) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  backgroundColor:
                                      Color.fromARGB(255, 26, 108, 3),

                                  content: Text(' Registro Exitoso'),
                                  duration: Duration(
                                      seconds:
                                          3), // Opcional: Configura la duración del SnackBar
                                ),
                              );
                              /* showTemporaryDialog(context, 'Datos guardados'); */
                              clearForm();
                              Navigator.pop(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ListarEstaciones()),
                              );
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  backgroundColor:
                                      Color.fromARGB(255, 84, 18, 4),

                                  content: Text('Error de Registro'),
                                  duration: Duration(
                                      seconds:
                                          3), // Opcional: Configura la duración del SnackBar
                                ),
                              );
                            }
                          }
                        }
                      },
                      child: const Text('Guardar'),
                    ),
                  ],
                ),
              ),
            ),
            isLoading == true
                ? Container(
                    color: const Color.fromARGB(26, 0, 0, 0),
                    height: double.maxFinite,
                    width: double.maxFinite,
                    child: const Center(
                      child: CircularProgressIndicator(),
                    ),
                  )
                : Text('')
          ],
        ),
      ),
    );
  }

  /*  void showTemporaryDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Respuesta'),
          content: Text(message),
        );
      },
    );

    // Programa el cierre del diálogo después de 2 segundos
    Future.delayed(Duration(seconds: 2), () {
      Navigator.of(context).pop();
    });
  } */
}
