import 'package:appproyecto2/Login/login.dart';
import 'package:appproyecto2/home/home_page.dart';
import 'package:appproyecto2/home/reportes_page.dart';
import 'package:flutter/material.dart';
import 'package:scroll_navigation/misc/navigation_helpers.dart';
import 'package:scroll_navigation/navigation/scroll_navigation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MenuNavegacion extends StatelessWidget {
  MenuNavegacion({Key? key}) : super(key: key);
  String name = 'Sin usuario loggeado';
  void getUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    name = prefs.getString('name') ?? 'xd';
  }

  @override
  Widget build(BuildContext context) {
    getUser();
    return ScrollNavigation(
      bodyStyle: const NavigationBodyStyle(
        /* Container(color: Colors.blue[100]), */
        background: Colors.white,
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
      ),
      barStyle: const NavigationBarStyle(
        background: Color.fromARGB(255, 222, 222, 222),
        elevation: 0.0,
      ),
      pages: [
        /*  Home(), */
        /*  ListaMonitoreo(), */
        const HomePage(),
        const ReportesPage(),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Nombre de usuario loaggeado $name'),
            TextButton(
                onPressed: () async {
                  SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                  prefs.remove('id');
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const LoginScreen()),
                  );
                },
                child: Text('Cerrar sesion')),
          ],
        )
        /*    AccountPage(), */
      ],
      items: const [
        /*      ScrollNavigationItem(icon: Icon(Icons.home)), */
        /*  ScrollNavigationItem(icon: Icon(Icons.chat)), */
        ScrollNavigationItem(icon: Icon(Icons.home)),
        ScrollNavigationItem(icon: Icon(Icons.add_chart)),
        ScrollNavigationItem(icon: Icon(Icons.add_chart)),
        /*   ScrollNavigationItem(icon: Icon(Icons.person)) */
      ],
    );
  }
}
