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

class FormularioPage2 extends StatefulWidget {
  @override
  _FormularioPageState createState() => _FormularioPageState();
}

class _FormularioPageState extends State<FormularioPage2> {
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
  DateTime now = DateTime.now();
  TextEditingController textEditingController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String comentarios = "";
  String fecha = "";
  String long = "";
  String lat = "";
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
/*   final formattedDate = "${now.day}-${now.month}-${now.year}"; */

  @override
  void _onTextChanged(String value) {
    // Realiza acciones cuando se ingresa texto
    print("Texto ingresado: $value");
  }

  void clearDropdown() {
    setState(() {
      String selectedValueTV =
          ''; // Esto restablecerá el valor del DropdownButton
    });
  }

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

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

/*   String selectedValueModulador = '';
  String selectedValueModulador = ''; */

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

  Future<void> _guardarDatos(
      tv,
      modulador,
      radiofm,
      transmisor,
      antenatv,
      antenafm,
      receptorsatelital,
      antenaparabolica,
      pozotierra,
      pararrayos,
      image,
      long,
      lat,
      fecha,
      comentarios,
      image2,
      id) async {
    //var url = 'http://10.0.2.2:3001/guardar-datos';
    var url = 'http://10.0.2.2:3001/apiv1/project/add';

    var body = {
      'tv': tv,
      'modulador': modulador,
      'radiofm': radiofm,
      'transmisor': transmisor,
      'antenatv': antenatv,
      'antenafm': antenafm,
      'receptorsatelital': receptorsatelital,
      'antenaparabolica': antenaparabolica,
      'pozotierra': pozotierra,
      'pararrayos': pararrayos,
      'image': image,
      'long': position.longitude.toString(),
      'lat': position.latitude.toString(),
      'fecha': fecha = "${now.day}-${now.month}-${now.year}",
      'comentarios': textEditingController.text,
      'image2': image2,
      'idUser': id
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
/*     DateTime now = DateTime.now();
    final formattedDate = "${now.day}-${now.month}-${now.year}"; */
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
                /*   Container(
                  alignment: Alignment.centerLeft,
                  width: double.infinity,
                  // color: Colors.grey,
                  child: Text(
                    'Fecha de Inspección: $now',
                  ),
                ), */

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
                    'SELECCIONE',
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
                    controller: textEditingController,
                    decoration: InputDecoration(
                      labelText: 'Introduce un texto',
                    ),
                    onChanged:
                        _onTextChanged, // Manejador de cambios en el texto
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
                                      borderRadius: BorderRadius.circular(100),
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
                ElevatedButton(
                  onPressed: () async {
                    // if (selectedValueTV.isEmpty) {
                    //   //Aca se puede mostrar un alerta
                    //   showDialog<String>(
                    //     context: context,
                    //     builder: (BuildContext context) => AlertDialog(
                    //       title: const Text('Alerta'),
                    //       content: const Text('No Selecciono un Estado'),
                    //       actions: <Widget>[
                    //         TextButton(
                    //           onPressed: () => Navigator.pop(context, 'Cancel'),
                    //           child: const Text('Cancel'),
                    //         ),
                    //         TextButton(
                    //           onPressed: () => Navigator.pop(context, 'OK'),
                    //           child: const Text('OK'),
                    //         ),
                    //       ],
                    //     ),
                    //   );
                    if (base64image.isEmpty) {
                      //Aca se puede mostrar un alerta
                      showDialog<String>(
                        context: context,
                        builder: (BuildContext context) => AlertDialog(
                          title: const Text('Alerta'),
                          content: const Text('Toma evidencias, fotografia'),
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
                    } else {
                      SharedPreferences prefs =
                          await SharedPreferences.getInstance();
                      final iduser = prefs.getString('id');
                      _guardarDatos(
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
                          long,
                          lat,
                          fecha,
                          comentarios,
                          base64image2,
                          iduser);
                    }
                  },
                  child: const Text('Guardar'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
