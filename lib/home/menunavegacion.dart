import 'package:appproyecto2/home/home_page.dart';
import 'package:appproyecto2/home/reportes_page.dart';
import 'package:flutter/material.dart';
import 'package:scroll_navigation/misc/navigation_helpers.dart';
import 'package:scroll_navigation/navigation/scroll_navigation.dart';

class MenuNavegacion extends StatelessWidget {
  const MenuNavegacion({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
      pages: const [
        /*  Home(), */
        /*  ListaMonitoreo(), */
        HomePage(),
        ReportesPage(),
        /*    AccountPage(), */
      ],
      items: const [
        /*      ScrollNavigationItem(icon: Icon(Icons.home)), */
        /*  ScrollNavigationItem(icon: Icon(Icons.chat)), */
        ScrollNavigationItem(icon: Icon(Icons.home)),
        ScrollNavigationItem(icon: Icon(Icons.add_chart)),
        /*   ScrollNavigationItem(icon: Icon(Icons.person)) */
      ],
    );
  }
}
