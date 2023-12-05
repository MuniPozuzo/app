// ignore_for_file: unused_import
import 'dart:convert';
import 'dart:io';

import 'package:appproyecto2/home/Registro2_all.dart';
import 'package:appproyecto2/home/list1.dart';
import 'package:appproyecto2/home/listview.dart';
import 'package:appproyecto2/pages/Inspectionregister.dart';
import 'package:http/http.dart' as http;
import 'package:appproyecto2/home/Registro%20copy.dart';
import 'package:appproyecto2/home/Registro2.dart';
import 'package:appproyecto2/home/dialog.dart';
import 'package:appproyecto2/home/drop.dart';
import 'package:appproyecto2/home/foto2.dart';
import 'package:appproyecto2/home/gps.dart';
import 'package:flutter/material.dart';

/* import 'formulario_supervisor.dart'; */

//import 'package:mi_pais/TramaProyectos.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  get press => null;
/*   Future<List> fetchData() async {
    final response =
        await http.get(Uri.parse('http://10.0.2.2:3001/getImages'));

    if (response.statusCode == 200) {
      // Si la solicitud fue exitosa, parsea la respuesta JSON
      final data = json.decode(response.body);
      return data["images"];
    } else {
      // Si la solicitud falla, muestra un mensaje de error
      print('Error al obtener datos. Código de estado: ${response.statusCode}');
    }
    throw ["images"];
  } */

  @override
  Widget build(BuildContext context) {
    /*  String rolusuario = GetStorage().read("rolusuario"); */
    // to get size
    var size = MediaQuery.of(context).size;
    // style
    // ignore: unused_local_variable, prefer_const_constructors
    var cardTextStyle = TextStyle(
        fontFamily: "Montserrat Regular",
        fontSize: 14,
        color: const Color.fromRGBO(63, 63, 63, 1));

    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(top: 0),
            height: size.height * 0.5,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  alignment: Alignment.topCenter,
                  image: AssetImage('assets/top_header3.png')),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: <Widget>[
                  Container(
                    height: 150,
                  ),
                  Expanded(
                    child: GridView.count(
                      mainAxisSpacing: 50,
                      crossAxisSpacing: 10,
                      primary: false,
                      crossAxisCount: 2,
                      children: <Widget>[
                        Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                          elevation: 4,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              // FormularioPage2()
                                              inspectionRegister()));
                                  /*   FormPage(
                                                title: '',
                                              ))); */

                                  /*      RecursoInsertarMonitoreoProyecto())); */
                                },
                                child: SizedBox(
                                  height: 80,
                                  width: 80,
                                  child: Image.asset('assets/registro.png'),
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.all(30),
                                child: const Text(
                                  'Nueva Inspección',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    height: 0.8,
                                    color: Colors.black,
                                    fontSize: 14,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                          elevation: 4,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>

                                              /*   List1())); */
                                              ListViewFromSqlServer()));
                                  /*      RecursoInsertarMonitoreoProyecto())); */
                                },
                                child: SizedBox(
                                  height: 80,
                                  width: 80,
                                  child: Image.asset('assets/lista.png'),
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.all(30),
                                child: const Text(
                                  'Lista de Inspecciones',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    height: 0.8,
                                    color: Colors.black,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                        /*     Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                          elevation: 4,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              InkWell(
                                /*    onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              ListaMonitoreos()));
                                  /*      RecursoInsertarMonitoreoProyecto())); */
                                }, */
                                child: SizedBox(
                                  height: 80,
                                  width: 80,
                                  child: Image.asset('assets/lista.png'),
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.all(30),
                                child: const Text(
                                  'Lista de Monitoreos',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    height: 0.8,
                                    color: Colors.black,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ), */
                        /*    Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                          elevation: 4,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              InkWell(
                                /*  onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => MiPantalla()));
                                  /*      RecursoInsertarMonitoreoProyecto())); */
                                }, */
                                child: SizedBox(
                                  height: 80,
                                  width: 80,
                                  child: Image.asset('assets/consulta4.png'),
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.all(30),
                                child: const Text(
                                  'Reportes',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    height: 0.8,
                                    color: Colors.black,
                                    fontSize: 14,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          ),
                        ), */
                      ],
                    ),
                  ),
                  /*           Container(
                    width: double.infinity,
                    height: 400,
                    color: Colors.red,
                    child: FutureBuilder(
                      future: fetchData(),
                      builder:
                          (BuildContext context, AsyncSnapshot<List> snapshot) {
                        switch (snapshot.connectionState) {
                          case ConnectionState.none:
                            return Text('Esperando la solicitud');
                          case ConnectionState.active:
                          case ConnectionState.waiting:
                            return Text('Cargando...');
                          case ConnectionState.done:
                            if (snapshot.hasError)
                              return Text('Error: ${snapshot.error}');
                            return ListView.builder(
                                itemCount: snapshot.data!.length,
                                scrollDirection: Axis.vertical,
                                itemBuilder: (context, index) {
                                  final MaterialColor col = index % 2 == 0
                                      ? Colors.red
                                      : Colors.green;
                                  return Container(
                                      padding: const EdgeInsets.all(20),
                                      color: col,
                                      child: Image.memory(
                                          base64Decode(snapshot.data![index])));
                                });
                        }
                      },
                    ),
                  ) */
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
