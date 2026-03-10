import 'package:flutter/material.dart';

class PrayerSchedule {
  final DateTime date;
  final List<PrayerTimeDetail> prayerTimes;

  PrayerSchedule({required this.date, required this.prayerTimes});
}

class PrayerTimeDetail {
  final String label;
  final String time;
  final IconData icon;
  final bool isActive;

  PrayerTimeDetail({
    required this.label,
    required this.time,
    required this.icon,
    this.isActive = false,
  });
}
