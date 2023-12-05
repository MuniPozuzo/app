import 'package:appproyecto2/home/Registro2_all.dart';
import 'package:flutter/material.dart';

class inspectionRegister extends StatelessWidget {
  const inspectionRegister({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [FormularioPage2()],
      ),
    );
  }
}
