import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import '../models/exam.dart';

class ExamLocationMap extends StatelessWidget {
  final Exam exam;

  const ExamLocationMap({super.key, required this.exam});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Exam Location Map'),
        backgroundColor: Colors.blueGrey,
        titleTextStyle: const TextStyle(
            fontWeight: FontWeight.bold, color: Colors.white, fontSize: 20),
      ),
      body: FlutterMap(
        options: MapOptions(
          center: LatLng(exam.latitude, exam.longitude),
          zoom: 14,
        ),
        children: [
          TileLayer(
            urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
            userAgentPackageName:
            'com.example.exams',
          ),
          MarkerLayer(
            markers: [
              Marker(
                point: LatLng(exam.latitude, exam.longitude),
                builder: (context) => const Icon(
                  Icons.location_on,
                  color: Colors.red,
                  size: 40,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}