// ignore_for_file: use_build_context_synchronously, avoid_print
import 'dart:convert';
/* import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mi_pais/pages/extern/cuaderno_obra_residente.dart'; */

import 'package:flutter/material.dart';

import '../home/menunavegacion.dart';
/* import 'package:http/http.dart' as http;
import 'dart:io';
import 'package:mi_pais/pages/NetworkHandler.dart';
import 'package:mi_pais/pages/mongodb/MongoDBModel.dart';
import 'package:mi_pais/pages/widgets/MenuNavegacion/menu_navegacion.dart'; */

class LoginScreen extends StatefulWidget {
  // ignore: use_key_in_widget_constructors
  const LoginScreen();

  @override
  // ignore: library_private_types_in_public_api
  _LoginScreenState createState() => _LoginScreenState();
}

// ignore: camel_case_types

/* String codigoUsuario; */

class _LoginScreenState extends State<LoginScreen> {
  bool vis = true;
  final _globalkey = GlobalKey<FormState>();
/*   NetworkHandler networkHandler = NetworkHandler(); */
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  String errorText = "";
  bool validate = false;
  bool circular = false;

  get networkHandler => null;

  get storage => null;
/*   final storage = new FlutterSecureStorage(); */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: initWidget(),
    );
  }

  Widget initWidget() {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _globalkey,
          child: Column(
            children: [
              Container(
                height: 400,
                // ignore: prefer_const_constructors
                decoration: BoxDecoration(
                  borderRadius:
                      const BorderRadius.only(bottomLeft: Radius.circular(90)),
                  image: const DecorationImage(
                    image: AssetImage('assets/screen_login.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Center(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 60),
                    alignment: Alignment.centerRight,
                    child: const Text(
                      "Ingrese sus Credenciales",
                      style: TextStyle(
                          fontSize: 18,
                          color: Color.fromARGB(255, 22, 41, 146),
                          fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              )),
              Container(
                  alignment: Alignment.center,
                  margin: const EdgeInsets.only(left: 20, right: 20, top: 50),
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Column(
                    children: [
                      CorreoTextfield(),
                      PasswordTextfield(),
                    ],
                  )),
              InkWell(
                onTap: () async {
                  setState(() {
                    circular = true;
                    String title = "Login";
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MenuNavegacion()),
                    );
                  });

                  //Login Logic start here
                  Map<String, String> data = {
                    /*      "username": _usernameController.text, */
                    "codigo": _emailController.text,
                    "password": _passwordController.text,
                  };

                  /*  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>  const MyHomePage(),
                      ),
                      (route) => false) */
                  ;
                  /*        /* var response = await networkHandler.post("/user/login", data); */
                  var response =
                      await networkHandler.post("/api/auth/signin", data); */

                  /*   if (response.statusCode == 200 ||
                      response.statusCode == 201) {
                    Map<String, dynamic> output = json.decode(response.body);

                    final codigousuario = output["userFound"]["codigo"];
                    final nombreusuario = output["userFound"]["usuario"];
                    final rolusuario = output["userFound"]["roles"][0]["name"];
                    final datosusuario = GetStorage();

                    datosusuario.write("codigousuario", codigousuario);
                    datosusuario.write("nombreusuario", nombreusuario);
                    datosusuario.write("rolusuario", rolusuario);
                    print(output["token"]);
                    await storage.write(key: "token", value: output["token"]);
                    /* setState(() {
                      validate = true;
                      circular = false;
                    }); */
/* 
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const MenuNavegacion(),
                        ),
                        (route) => false);
                  } else {
                    String output = json.decode(response.body);
                    setState(() {
                      validate = false;
                      errorText = output;
                      circular = false;
                    }); */
                  }
 */
                  // login logic End here
                },
                child: Container(
                  alignment: Alignment.center,
                  margin: const EdgeInsets.only(left: 20, right: 20, top: 40),
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  height: 54,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                      (const Color(0xffF5591F)),
                      new Color(0xffF2861E)
                    ], begin: Alignment.centerLeft, end: Alignment.centerRight),
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.grey[200],
                    boxShadow: const [
                      BoxShadow(
                          offset: Offset(0, 10),
                          blurRadius: 20,
                          color: Color.fromARGB(255, 241, 161, 161)),
                    ],
                  ),
                  child: const Text(
                    "INGRESAR",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Center(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 40),
                    alignment: Alignment.centerRight,
                    child: const Text(
                      "Al Ingresar, acepta nuestros Terminos & Condiciones",
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                  )
                ],
              )),
            ],
          ),
        ),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Widget CorreoTextfield() => TextFormField(
        /*  controller: _usernameController, */
        controller: _emailController,
        decoration: InputDecoration(
          /*   errorText: validate ? null : errorText, */
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.transparent),
            borderRadius: BorderRadius.circular(50),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.transparent),
            borderRadius: BorderRadius.circular(50),
          ),
          prefixIcon: const Icon(
            Icons.person,
            color: const Color.fromARGB(255, 4, 107, 191),
          ),
          hintText: "Ingrese su Correo",
          hintStyle:
              const TextStyle(color: const Color.fromARGB(255, 42, 73, 119)),
          filled: true,
          fillColor: const Color.fromARGB(255, 224, 224, 224),
        ),
      );

  // ignore: non_constant_identifier_names
  Widget PasswordTextfield() {
    return Column(
      children: [
        const Text(""),
        TextFormField(
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.transparent),
              borderRadius: BorderRadius.circular(50),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.transparent),
              borderRadius: BorderRadius.circular(50),
            ),
            prefixIcon: const Icon(
              Icons.key,
              color: const Color.fromARGB(255, 4, 107, 191),
            ),
            hintText: "Ingrese Contraseña",
            hintStyle: const TextStyle(color: Color.fromARGB(255, 42, 73, 119)),
            filled: true,
            fillColor: const Color.fromARGB(255, 224, 224, 224),
            /* errorText: validate ? null : errorText, */
            suffixIcon: IconButton(
              icon: Icon(vis ? Icons.visibility_off : Icons.visibility),
              onPressed: () {
                setState(() {
                  vis = !vis;
                });
              },
            ),
            helperStyle: const TextStyle(
              fontSize: 14,
            ),
          ),
          controller: _passwordController,
          cursorColor: const Color.fromARGB(255, 4, 107, 191),
          obscureText: vis,
        ),
      ],
    );
  }
}

class GetStorage {
  void write(String s, codigousuario) {}
}
