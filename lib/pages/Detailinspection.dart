import 'dart:convert';

import 'package:appproyecto2/modelo/Inspections.dart';
import 'package:flutter/material.dart';

class Detailinspection extends StatelessWidget {
  Detailinspection({super.key, required this.inspectionElement});
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
                'ID: ${inspectionElement.id}',
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text('Fecha: ${inspectionElement.fecha}'),
              const SizedBox(height: 16),
              const Text(
                'Detalles de la Inspección',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const Divider(height: 16, thickness: 2),
              _buildDetailRow('TV', inspectionElement.tv),
              _buildDetailRow('Modulador', inspectionElement.modulador),
              _buildDetailRow('Radio FM', inspectionElement.radiofm),
              _buildDetailRow('Transmisor', inspectionElement.transmisor),
              _buildDetailRow('Antena TV', inspectionElement.antenatv),
              _buildDetailRow('Antena FM', inspectionElement.antenafm),
              _buildDetailRow(
                  'Receptor Satelital', inspectionElement.receptorsatelital),
              _buildDetailRow(
                  'Antena Parabólica', inspectionElement.antenaparabolica),
              _buildDetailRow('Pozo Tierra', inspectionElement.pozotierra),
              _buildDetailRow('Pararrayos', inspectionElement.pararrayos),
              const SizedBox(height: 16),
              const Text(
                'Información Adicional',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const Divider(height: 16, thickness: 2),
              _buildDetailRow('Longitud', inspectionElement.long),
              _buildDetailRow('Latitud', inspectionElement.lat),
              _buildDetailRowImage('Imagen', inspectionElement.image),
              _buildDetailRowImage('Imagen 2', inspectionElement.image2),
              const SizedBox(height: 16),
              const Text(
                'Usuario',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const Divider(height: 16, thickness: 2),
              _buildDetailRow('Comentarios', inspectionElement.comentarios),
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
