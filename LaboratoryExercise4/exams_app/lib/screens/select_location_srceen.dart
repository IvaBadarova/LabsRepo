import 'package:flutter/material.dart';

class SelectLocationScreen extends StatefulWidget {
  final Function(double latitude, double longitude) onLocationPicked;

  const SelectLocationScreen({super.key, required this.onLocationPicked});

  @override
  State<SelectLocationScreen> createState() => _SelectLocationScreenState();
}

class _SelectLocationScreenState extends State<SelectLocationScreen> {
  final TextEditingController _latitudeController = TextEditingController();
  final TextEditingController _longitudeController = TextEditingController();

  void _confirmLocation() {
    final String latitudeText = _latitudeController.text;
    final String longitudeText = _longitudeController.text;
    final double? latitude = double.tryParse(latitudeText);
    final double? longitude = double.tryParse(longitudeText);

    if (latitude != null && longitude != null) {
      widget.onLocationPicked(latitude, longitude);
      Navigator.pop(context);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text('Please enter valid latitude and longitude')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pick Exam Location'),
        backgroundColor: Colors.blueGrey,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Enter Latitude:',
              style: TextStyle(fontSize: 18),
            ),
            TextField(
              controller: _latitudeController,
              keyboardType:
              const TextInputType.numberWithOptions(decimal: true),
              decoration: const InputDecoration(
                labelText: 'Latitude',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Enter Longitude:',
              style: TextStyle(fontSize: 18),
            ),
            TextField(
              controller: _longitudeController,
              keyboardType:
              const TextInputType.numberWithOptions(decimal: true),
              decoration: const InputDecoration(
                labelText: 'Longitude',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _confirmLocation,
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.blueGrey,
              ),
              child: const Text('Confirm Location'),
            ),
          ],
        ),
      ),
    );
  }
}
