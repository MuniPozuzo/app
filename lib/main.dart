import 'package:appproyecto2/Login/login.dart';
import 'package:flutter/material.dart';

void main() {
/*   WidgetsFlutterBinding.ensureInitialized(); // esto que es ? */

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String? get title => null;

/*   int currentState = 0; */
/*   Widget page = SplashScreen(); */

  @override
/*   void initState() {
    super.initState();
   /*  checkLogin(); */
  }
 */
/*   void checkLogin() async {
    String token = await storage.read(key: "token");
    // ignore: unnecessary_null_comparison
    if (token != null) {
      setState(() {
        page = const MenuNavegacion();
      });
    } else {
      setState(() {
        /*       page = const LoginScreen(); */
        page = const LoginScreen();
      });
    }
  } */

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
      home: const LoginScreen(),
    );
  }
}

/* class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
        '/second': (context) => SecondScreen(),
      },
    );
  }
}
 */