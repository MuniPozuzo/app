// ignore_for_file: use_build_context_synchronously, avoid_print, depend_on_referenced_packages
import 'dart:convert';
/* import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mi_pais/pages/extern/cuaderno_obra_residente.dart'; */

import 'package:appproyecto2/modelo/authmodel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../home/menunavegacion.dart';
// Librerias para alaerta
import 'package:fluttertoast/fluttertoast.dart';

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
  /*  TextEditingController _usernameController = TextEditingController(); */
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

  Future<AutModel> login() async {
    final String username = _emailController.text;
    final String pass = _passwordController.text;
    final response = await http.post(
      Uri.parse('http://10.0.2.2:3001/apiv1/auth/login'),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: json.encode({
        'username': username,
        'password': pass,
      }),
    );

    AutModel res = authFromJson(response.body);

    return res;
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
                    image: AssetImage('assets/login_app2.jpg'),
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
                  final pass = _passwordController.text;
                  final email = _emailController.text;
                  try {
                    if (email.isEmpty) {
                      Fluttertoast.showToast(msg: 'Correo vacio');
                      return print('email vacio');
                    }
                    if (pass.isEmpty) {
                      Fluttertoast.showToast(msg: 'Paswword vacio');
                      return print('pass vacio');
                    }
                  } catch (e) {
                    print(e);
                  }

                  final res = await login();

                  if (res.status == true) {
                    // Si todo esta bien guardar en shared y navegar ala otra pantalla
                    // Elimnando esta de login
                    SharedPreferences prefs =
                        await SharedPreferences.getInstance();
                    prefs.setString('id', res.user.id.toString());
                    prefs.setString('name', res.user.username.toString());
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => MenuNavegacion()),
                    );
                  } else {
                    /*     print('wenas xd'); */
                    Fluttertoast.showToast(
                        msg: '${res.message}',
                        toastLength: Toast.LENGTH_LONG,
                        gravity: ToastGravity.CENTER,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.green,
                        textColor: Colors.white,
                        fontSize: 16.0);
                    // Fluttertoast.cancel();
                  }
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
