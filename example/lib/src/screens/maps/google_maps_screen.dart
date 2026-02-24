import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:sentinels_main_front_ui/sentinels_main_front_ui.dart';

class GoogleMapsScreen extends StatelessWidget {
  const GoogleMapsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Maps',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
        const SizedBox(height: SentinelsSpacing.xl),
        SentinelsCard(
          title: 'OpenStreetMap Integration',
          padding: EdgeInsets.zero,
          child: SizedBox(
            height: 500,
            child: FlutterMap(
              options: const MapOptions(
                initialCenter: LatLng(51.5, -0.09),
                initialZoom: 13.0,
              ),
              children: [
                TileLayer(
                  urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                  userAgentPackageName: 'com.sentinels.demo',
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
