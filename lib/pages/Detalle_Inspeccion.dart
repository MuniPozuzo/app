// ignore_for_file: camel_case_types, prefer_const_constructors_in_immutables

import 'dart:convert';

import 'package:appproyecto2/models/Inspections.dart';
import 'package:flutter/material.dart';

class Detalle_Inspeccion extends StatelessWidget {
  Detalle_Inspeccion({super.key, required this.inspectionElement});
  final InspectionElement inspectionElement;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalles de la Inspección'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Nombre de Estación: ${inspectionElement.nombreestacion}',
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                'ID Estación: ${inspectionElement.ideEstacion}',
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text(
                  'Fecha: ${inspectionElement.fecInspeccion.year}-${inspectionElement.fecInspeccion.month}-${inspectionElement.fecInspeccion.day} ${inspectionElement.fecInspeccion.hour}:${inspectionElement.fecInspeccion.minute}:${inspectionElement.fecInspeccion.second}'),
              const SizedBox(height: 16),
              const Text(
                'Detalles de la Inspección',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const Divider(height: 16, thickness: 2),
              Container(
                alignment: Alignment.centerRight,
                child: Align(
                  alignment: Alignment.topRight,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _buildDetailRow(
                            'TV', inspectionElement.estTxTelevision),
                        _buildDetailRow(
                            'Modulador', inspectionElement.estModuladorTv),
                        _buildDetailRow(
                            'Radio FM', inspectionElement.estRadioFm),
                        _buildDetailRow(
                            'Transmisor', inspectionElement.estTransmisorHf),
                        _buildDetailRow(
                            'Antena TV', inspectionElement.estAntenaTv),
                        _buildDetailRow(
                            'Antena FM', inspectionElement.estAntenaFm),
                        _buildDetailRow('Receptor Satelital',
                            inspectionElement.estReceptorSatelital),
                        _buildDetailRow('Antena Parabólica',
                            inspectionElement.estAntenaParabolica),
                        _buildDetailRow(
                            'Pozo Tierra', inspectionElement.estPozoTierra),
                        _buildDetailRow(
                            'Pararrayos', inspectionElement.estPararrayos),
                      ]),
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Información Adicional',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const Divider(height: 16, thickness: 2),
              _buildDetailRow(
                  'Latitud', inspectionElement.numLatitud.toString()),
              _buildDetailRow(
                  'Longitud', inspectionElement.numLongitud.toString()),
              _buildDetailRowImage('Imagen', inspectionElement.imgFoto1),
              _buildDetailRowImage('Imagen 2', inspectionElement.imgFoto2),
              const SizedBox(height: 16),
              /*  const Text(
                'Usuario',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ), */
              const Divider(height: 16, thickness: 2),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Recomendacion:',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Text(inspectionElement.desRecomendacion),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Concluciones:',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Text(inspectionElement.desConclusiones),
                ],
              ),
              const Divider(height: 16, thickness: 2),
              _buildDetailRow(
                  'ID Usuario', inspectionElement.idUsuario.toString()),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(width: 16),
          Text(value),
        ],
      ),
    );
  }

  Widget _buildDetailRowImage(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(width: 16),
          ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: Image.memory(
              base64Decode(value),
              height: 70,
              width: 70,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}
