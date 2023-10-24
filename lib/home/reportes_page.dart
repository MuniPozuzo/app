// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

//import 'package:mi_pais/TramaProyectos.dart';

class ReportesPage extends StatefulWidget {
  const ReportesPage({Key? key}) : super(key: key);

  @override
  _ReportesPageState createState() => _ReportesPageState();
}

class _ReportesPageState extends State<ReportesPage> {
  get press => null;

  @override
  Widget build(BuildContext context) {
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
                                  /*  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              CuadernoObraResidente())) */
                                  ;
                                },
                                child: SizedBox(
                                  height: 80,
                                  width: 80,
                                  child: Image.asset('assets/computacion1.png'),
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.all(3),
                                child: const Text(
                                  'Reportes Proyectos',
                                  style: TextStyle(
                                    height: 0.8,
                                    color: Colors.black,
                                    fontSize: 12,
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
                                  /*  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              RecursoInsertarMonitoreoProyecto())); */
                                },
                                child: SizedBox(
                                  height: 80,
                                  width: 80,
                                  child: Image.asset('assets/consulta2.png'),
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.all(5),
                                child: const Text(
                                  'Reportes Intervenciones',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    height: 0.8,
                                    color: Colors.black,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        /*   Card(
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
                                              MonitoreoProyecto()));
                                },
                                child: SizedBox(
                                  height: 80,
                                  width: 80,
                                  child: Image.asset('assets/consulta3.png'),
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.all(5),
                                child: const Text(
                                  'Cargar Proyectos Asignados',
                                  style: TextStyle(
                                    height: 0.8,
                                    color: Colors.black,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ), */
                        /* Card(
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
                                              const FindFriends()));
                                },
                                child: SizedBox(
                                  height: 80,
                                  width: 80,
                                  child: Image.asset('assets/busqueda_gps.png'),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(5),
                                child: const Text(
                                  'Busqueda Gps',
                                  style: TextStyle(
                                    height: 0.8,
                                    color: Colors.black,
                                    fontSize: 12,
                                  ),
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
