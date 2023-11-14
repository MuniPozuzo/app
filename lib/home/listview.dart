import 'dart:convert';
import 'package:appproyecto2/modelo/Inspections.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ListViewFromSqlServer extends StatefulWidget {
  @override
  _ListViewFromSqlServerState createState() => _ListViewFromSqlServerState();
}

class _ListViewFromSqlServerState extends State<ListViewFromSqlServer> {
  List<dynamic> data = [];
  String id = '';
  @override
  void initState() {
    super.initState();
    getIdShared();
  }

  void getIdShared() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String idGuardado = prefs.getString('id') ?? "";

    setState(() {
      id = idGuardado;
    });
  }

  Future<Inspection> getInspections() async {
    const url = "http://10.0.2.2:3001/apiv1/project/getByUser";
    final response = await http.post(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: json.encode({
        'id': id,
      }),
    );
    return inspectionFromJson(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Inspecciones'),
      ),
      body: FutureBuilder<Inspection>(
        future: getInspections(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // Mientras se obtienen los datos, puedes mostrar un indicador de carga.
            return CircularProgressIndicator();
          } else if (snapshot.hasError) {
            // En caso de error, muestra un mensaje de error.
            return Text('Error: ${snapshot.error}');
          } else {
            final inspection = snapshot.data!.inspection;
            // Cuando los datos están disponibles, construye tu widget.
            return ListView.builder(
              itemCount: inspection.length,
              itemBuilder: (BuildContext context, int index) {
                // Accede al elemento específico en tu lista usando tuLista[index]
                final elemento = inspection[index];

                return ListTile(
                  title: Text(elemento.comentarios),
                  subtitle: Text(elemento.idUsuario.toString()),
                  leading: Icon(Icons.web),
                );
              },
            );
          }
        },
      ),
    );
  }
}
