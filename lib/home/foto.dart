import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

Future<void> subirImagen(File imageFile, String nombre) async {
  String base64Image = base64Encode(imageFile.readAsBytesSync());

  final response = await http.post(
    Uri.parse(
        'http://10.0.2.2:3001/guardarImagen'), // Reemplaza con la URL de tu servidor Node.js
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, dynamic>{
      'nombre': nombre,
      'base64Image': base64Image,
    }),
  );

  if (response.statusCode == 200) {
    print('Imagen guardada correctamente');
  } else {
    print('Error al guardar la imagen');
  }
}
