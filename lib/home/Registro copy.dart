/* // ignore_for_file: unused_import, avoid_print, prefer_final_fields
/* import 'dart:html'; */
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
// ignore: implementation_imports
import 'package:dropdown_button2/src/dropdown_button2.dart';
import 'package:intl/intl.dart';

class FormularioPage extends StatefulWidget {
  @override
  _FormularioPageState createState() => _FormularioPageState();
}

class _FormularioPageState extends State<FormularioPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController _nombre = TextEditingController();

  String? selectedValue;
  Future<void> _guardarDatos() async {
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
  }

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('yyyy-MM-dd').format(now);
    return Scaffold(
      appBar: AppBar(
        title: Text('Monitoreo Supervisor'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: _nombre,
                  decoration:
                      InputDecoration(labelText: 'Nombre del Beneficiario'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Por favor ingresa el nombre';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 40.0, width: 30),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _guardarDatos();
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