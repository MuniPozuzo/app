import 'package:appproyecto2/Login/login.dart';
import 'package:appproyecto2/home/menunavegacion.dart';
import 'package:flutter/material.dart';
// Shared preferences
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  final user = prefs.getString('id') ?? '';
  runApp(MyApp(user: user));
}

class MyApp extends StatefulWidget {
  const MyApp({
    Key? key,
    required this.user,
  }) : super(key: key);
  final user;
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String? get title => null;

  @override
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PNVR APP',
      debugShowCheckedModeBanner: false,
      initialRoute: 'login',
      theme: ThemeData(
        primaryColor: Colors.indigo,
      ),
      /*  home: const LoginScreen(), */
      home: widget.user == '' ? const LoginScreen() : MenuNavegacion(),
    );
  }
}
