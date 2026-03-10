import 'package:flutter/material.dart';

class PrayerTime {
  final String label;
  final String time;
  final IconData icon;
  final List<Color> colors;

  PrayerTime({
    required this.label,
    required this.time,
    required this.icon,
    required this.colors,
  });
}
