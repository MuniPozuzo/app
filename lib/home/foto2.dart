/* // ignore_for_file: unused_import, avoid_print, prefer_final_fields
/* import 'dart:html'; */
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
// ignore: implementation_imports
import 'package:dropdown_button2/src/dropdown_button2.dart';
import 'package:intl/intl.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:location/location.dart';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:dio/dio.dart';
import 'package:image_cropper/image_cropper.dart';

class Foto2 extends StatefulWidget {
  @override
  _Foto2State createState() => _Foto2State();
}

class _Foto2State extends State<Foto2> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

File? imagen =  null;
final picker = ImagePicker();

Future selimagen(op) async{
  var pickedFile;
  if(op ==1){
    pickedFile = await picker.pickImage(source: ImageSource.camera);  
  }else {
    pickedFile = await picker.pickImage(source: ImageSource.gallery);
  }

  setState(() {
    if( pickedFile !=null){
      // imagen =  file(pickedfile.path)
      cortar(File(pickedFile.path));
    }else{
      print('No se selecciono ninguna foto');
    }

    });
    Navigator.of(context).pop();
}

    cortar(picked)async{
      File? cortado = (await ImageCropper.cropImage(sourcePath: picked.path,
      aspectRatio: CropAspectRatio(ratioX: 1.0, ratioY: 1.0);
      
      )) as File?;
    }




  
  Dio dio = new Dio();

  Future<void> _subirimagen() async {
    try{
    String filename =  imagen.path;
    }catch(e){
      print(e.toString());
    }


  }

/*   Future<void> _guardarDatos() async {
    var url = 'http://10.0.2.2:3001/guardar-datos';
    var datos = {
      'nombre': _nombre.text,
    };

    var response = await http.post(
      Uri.parse(url),
      body: datos,
    );

    if (response.statusCode == 200) {
      print('Datos guardados exitosamente');
      // Realizar acciones adicionales después de guardar los datos
    } else {
      print(
          'Error al guardar los datos. Código de estado: ${response.statusCode}');
    }
  } */

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    final formattedDate = "${now.day}-${now.month}-${now.year}";
    /*  String formattedDate = DateFormat('yyyy-MM-dd').format(now); */
    return Scaffold(
      appBar: AppBar(
        title: Text('Foto'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                SizedBox(height: 40.0, width: 30),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _subirimagen();
                    }
                  },
                  child: Text('Guardar'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
 */