// ignore_for_file: unused_import

import 'package:appproyecto2/home/Registro.dart';
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
                                              FormularioPage()));
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
                                          builder: (context) => Home()));
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
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
