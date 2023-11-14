// ignore: file_names
// ignore_for_file: avoid_print, sort_child_properties_last, file_names, duplicate_ignore, prefer_const_constructors, depend_on_referenced_packages, unused_local_variable, use_key_in_widget_constructors, library_private_types_in_public_api

import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
// ignore: implementation_imports

List<DropdownMenuItem<String>> get dropdownItems {
  List<DropdownMenuItem<String>> menuItems = const [
    DropdownMenuItem(child: Text("Seleccione"), value: ""),
    DropdownMenuItem(child: Text("Regular"), value: "Regular"),
    DropdownMenuItem(child: Text("Bueno"), value: "Bueno"),
    DropdownMenuItem(child: Text("Malo"), value: "Malo"),
  ];
  return menuItems;
}

List<DropdownMenuItem<String>> get dropdownModuladorTV {
  List<DropdownMenuItem<String>> moduladorTVItems = const [
    DropdownMenuItem(child: Text("Seleccione"), value: ""),
    DropdownMenuItem(child: Text("Regular"), value: "Regular"),
    DropdownMenuItem(child: Text("Bueno"), value: "Bueno"),
    DropdownMenuItem(child: Text("Malo"), value: "Malo"),
  ];
  return moduladorTVItems;
}

List<DropdownMenuItem<String>> get dropdownRadioFM {
  List<DropdownMenuItem<String>> radioFMItems = const [
    DropdownMenuItem(child: Text("Seleccione"), value: ""),
    DropdownMenuItem(child: Text("Regular"), value: "Regular"),
    DropdownMenuItem(child: Text("Bueno"), value: "Bueno"),
    DropdownMenuItem(child: Text("Malo"), value: "Malo"),
  ];
  return radioFMItems;
}

List<DropdownMenuItem<String>> get dropdownTransmisorHF {
  List<DropdownMenuItem<String>> transmisorHFItems = const [
    DropdownMenuItem(child: Text("Seleccione"), value: ""),
    DropdownMenuItem(child: Text("Regular"), value: "Regular"),
    DropdownMenuItem(child: Text("Bueno"), value: "Bueno"),
    DropdownMenuItem(child: Text("Malo"), value: "Malo"),
  ];
  return transmisorHFItems;
}

List<DropdownMenuItem<String>> get dropdownAntenaTV {
  List<DropdownMenuItem<String>> antenaTVItems = const [
    DropdownMenuItem(child: Text("Seleccione"), value: ""),
    DropdownMenuItem(child: Text("Regular"), value: "Regular"),
    DropdownMenuItem(child: Text("Bueno"), value: "Bueno"),
    DropdownMenuItem(child: Text("Malo"), value: "Malo"),
  ];
  return antenaTVItems;
}

List<DropdownMenuItem<String>> get dropdownAntenaFM {
  List<DropdownMenuItem<String>> antenaFMItems = const [
    DropdownMenuItem(child: Text("Seleccione"), value: ""),
    DropdownMenuItem(child: Text("Regular"), value: "Regular"),
    DropdownMenuItem(child: Text("Bueno"), value: "Bueno"),
    DropdownMenuItem(child: Text("Malo"), value: "Malo"),
  ];
  return antenaFMItems;
}

List<DropdownMenuItem<String>> get dropdownreceptorSatelital {
  List<DropdownMenuItem<String>> receptorsatelitalItems = const [
    DropdownMenuItem(child: Text("Seleccione"), value: ""),
    DropdownMenuItem(child: Text("Regular"), value: "Regular"),
    DropdownMenuItem(child: Text("Bueno"), value: "Bueno"),
    DropdownMenuItem(child: Text("Malo"), value: "Malo"),
  ];
  return receptorsatelitalItems;
}

List<DropdownMenuItem<String>> get dropdownAntenaParabolica {
  List<DropdownMenuItem<String>> antenaprabolicaItems = const [
    DropdownMenuItem(child: Text("Seleccione"), value: ""),
    DropdownMenuItem(child: Text("Regular"), value: "Regular"),
    DropdownMenuItem(child: Text("Bueno"), value: "Bueno"),
    DropdownMenuItem(child: Text("Malo"), value: "Malo"),
  ];
  return antenaprabolicaItems;
}

List<DropdownMenuItem<String>> get dropdownPozoTierra {
  List<DropdownMenuItem<String>> pozotierraItems = const [
    DropdownMenuItem(child: Text("Seleccione"), value: ""),
    DropdownMenuItem(child: Text("Regular"), value: "Regular"),
    DropdownMenuItem(child: Text("Bueno"), value: "Bueno"),
    DropdownMenuItem(child: Text("Malo"), value: "Malo"),
  ];
  return pozotierraItems;
}

List<DropdownMenuItem<String>> get dropdownParaRayos {
  List<DropdownMenuItem<String>> pararayosItems = const [
    DropdownMenuItem(child: Text("Seleccione"), value: ""),
    DropdownMenuItem(child: Text("Regular"), value: "Regular"),
    DropdownMenuItem(child: Text("Bueno"), value: "Bueno"),
    DropdownMenuItem(child: Text("Malo"), value: "Malo"),
  ];
  return pararayosItems;
}

class FormularioPage extends StatefulWidget {
  @override
  _FormularioPageState createState() => _FormularioPageState();
}

class _FormularioPageState extends State<FormularioPage> {
  //Donde se guarda la imagen que se tome
  String base64image = "";
//Coordenadas
  bool servicestatus = false;
  bool haspermission = false;
  late LocationPermission permission;
  late Position position;
  String long = "", lat = "";
  late StreamSubscription<Position> positionStream;

  @override
  void initState() {
    checkGps();
    super.initState();
  }

//funcionpara enviar la imagen a la api, aca hace el envio
  Future sendImage() async {
    //Si no hay imagen no hacer nada
    if (base64image.isEmpty) return;
    //Esto es la peticion
    final body = {
      "image": base64image,
    };

    final bodyDecode = json.encode(body);

    final res = await http.post(
      /*      Uri.parse('https://7q1xfwwc-3001.brs.devtunnels.ms/UploadImage'), */
      Uri.parse('http://10.0.2.2:3001/UploadImage'),
      headers: {
        "Content-Type": "application/json",
      },
      body: bodyDecode,
    );
    if (res.statusCode == 200) {
      print('Datos guardados exitosamente');
    } else {
      print('Error al guardar los datos. Código de estado: ${res.body}');
    }
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

  checkGps() async {
    servicestatus = await Geolocator.isLocationServiceEnabled();
    if (servicestatus) {
      permission = await Geolocator.checkPermission();

      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          print('Location permissions are denied');
        } else if (permission == LocationPermission.deniedForever) {
          print("'Location permissions are permanently denied");
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
      print("GPS Service is not enabled, turn on GPS location");
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

    long = position.longitude.toString();
    lat = position.latitude.toString();

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

      long = position.longitude.toString();
      lat = position.latitude.toString();

      setState(() {
        //refresh UI on update
      });
    });
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
/*   String selectedValueModulador = '';
  String selectedValueModulador = ''; */

  Future<void> _guardarDatos(
      image,
      tv,
      modulador,
      radiofm,
      transmisor,
      antenatv,
      antenafm,
      receptorsatelital,
      antenaparabolica,
      pozotierra,
      pararayos) async {
    //var url = 'http://10.0.2.2:3001/guardar-datos';
    var url = 'http://10.0.2.2:3001/apiv1/project/add';

    var body = {
      'image': image,
      'tv': tv,
      'modulador': modulador,
      'radiofm': radiofm,
      'transmisor': transmisor,
      'antenatv': antenatv,
      'antenafm': antenafm,
      'receptorsatelital': receptorsatelital,
      'antenaparabolica': antenaparabolica,
      'pozotierra': pozotierra,
      'pararayos': pararayos,
    };
    final bodyDecode = json.encode(body);

    var response = await http.post(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: bodyDecode,
    );

    if (response.statusCode == 200) {
      print('Datos guardados exitosamente');
      // Realizar acciones adicionales después de guardar los datos
    } else {
      print(
          'Error al guardar los datos. Código de estado: ${response.statusCode}');
    }
  }

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    final formattedDate = "${now.day}-${now.month}-${now.year}";
    /*  String formattedDate = DateFormat('yyyy-MM-dd').format(now); */
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('INSPECCIÓN TÉCNICA '),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
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
                    'Fecha de Inspección: $formattedDate',
                  ),
                ),

                Container(
                  alignment: Alignment.centerLeft,
                  width: double.infinity,
                  // color: Colors.grey,
                  child: Text(
                    "Latitude: $lat",
                    style: TextStyle(fontSize: 14),
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  width: double.infinity,
                  // color: Colors.grey,
                  child:
                      Text("Longitude: $long", style: TextStyle(fontSize: 14)),
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
                    'Seleccione el Estado',
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
                        items: dropdownItems,
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
                            selectedValueReceptorSatelital = value.toString();
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
                            selectedValueAntenaParabolica = value.toString();
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
                      'PARA RAYOS',
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

                /*  const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      'MODULADOR TV',
                    ),
                    MyDropDowButton()
                  ],
                ),
                Container(
                  alignment: Alignment.center,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [Text('TX RADIO FM'), MyDropDowButton()],
                  ),
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [Text('TRANSMISOR HF'), MyDropDowButton()],
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [Text('ANTENA TV'), MyDropDowButton()],
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      'ANTENA FM',
                    ),
                    MyDropDowButton()
                  ],
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [Text('RECEPTOR SATELITAL'), MyDropDowButton()],
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [Text('ANTENA PARABOLICA'), MyDropDowButton()],
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [Text('POZO  A TIERRA'), MyDropDowButton()],
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [Text('PARA RAYOS'), MyDropDowButton()],
                ), */
                /*   const SizedBox(height: 40.0, width: 30),
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
                          child: const Center(
                            child: Text('Foto'),
                          ),
                        )
                      ],
                    )), */
                // Boton de guardar
                const SizedBox(height: 40.0, width: 30),

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
                                      borderRadius: BorderRadius.circular(100),
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
                      ],
                    )),
                ElevatedButton(
                  onPressed: () {
                    if (selectedValueTV.isEmpty) {
                      //Aca se puede mostrar un alerta
                      showDialog<String>(
                        context: context,
                        builder: (BuildContext context) => AlertDialog(
                          title: const Text('Alerta'),
                          content: const Text('No Selecciono un Estado'),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () => Navigator.pop(context, 'Cancel'),
                              child: const Text('Cancel'),
                            ),
                            TextButton(
                              onPressed: () => Navigator.pop(context, 'OK'),
                              child: const Text('OK'),
                            ),
                          ],
                        ),
                      );
                      if (base64image.isEmpty) {
                        //Aca se puede mostrar un alerta
                        showDialog<String>(
                          context: context,
                          builder: (BuildContext context) => AlertDialog(
                            title: const Text('Alerta'),
                            content: const Text('Toma evidencias, fotografia'),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () =>
                                    Navigator.pop(context, 'Cancel'),
                                child: const Text('Cancel'),
                              ),
                              TextButton(
                                onPressed: () => Navigator.pop(context, 'OK'),
                                child: const Text('OK'),
                              ),
                            ],
                          ),
                        );
                      }
                    } else {
                      _guardarDatos(
                          base64image,
                          selectedValueTV,
                          selectedValueModuladorTV,
                          selectedValueRadioFM,
                          selectedValueTransmisorHF,
                          selectedValueAntenaTV,
                          selectedValueAntenaFM,
                          selectedValueReceptorSatelital,
                          selectedValueAntenaParabolica,
                          selectedValuePozoTierra,
                          selectedValueParaRayos);
                    }
                  },
                  child: const Text('Guardar'),
                ),

                /*       ElevatedButton(
                    onPressed: sendImage, child: const Text('Enviar')), */

                // frase seleccionar imagen
                /*   Row(
                  children: [
                    TextButton(
                        onPressed: uploadImage,
                        child: const Text("Seleccionar imagen"))
                  ],
                ), */
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// TextFormField(
//                 controller: _nombre,
//                 decoration: const InputDecoration(
//                     labelText: 'Nombre del Beneficiario'),
//                 validator: (value) {
//                   if (value!.isEmpty) {
//                     return 'Por favor ingresa el nombre';
//                   }
//                   return null;
//                 },
//               ),
//               DropdownButtonHideUnderline(
//                 child: DropdownButton(
//                   value: "Quincenal",
//                   items: const [
//                     DropdownMenuItem(
//                         value: "Quincenal", child: Text("Quincenal")),
//                     DropdownMenuItem(
//                       value: "Mensual",
//                       child: Text("Mensual"),
//                     )
//                   ],
//                   onChanged: (value) {},
//                 ),
//               ),
//               const SizedBox(height: 40.0, width: 30),
//               ElevatedButton(
//                 onPressed: () {
//                   if (_formKey.currentState!.validate()) {
//                     _guardarDatos();
//                   }
//                 },
//                 child: const Text('Guardar'),
//               ),
