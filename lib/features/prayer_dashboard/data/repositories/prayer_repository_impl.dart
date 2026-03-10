import 'package:flutter/material.dart';
import '../../domain/entities/prayer_time.dart';
import '../../domain/repositories/prayer_repository.dart';

class PrayerRepositoryImpl implements PrayerRepository {
  @override
  Future<List<PrayerTime>> getPrayerTimes() async {
    // Mocking data for now as per current single-file implementation
    return [
      PrayerTime(
        label: 'Fajr',
        time: '5:25',
        icon: Icons.wb_twilight,
        colors: [Colors.orange.shade300, Colors.orange.shade600],
      ),
      PrayerTime(
        label: 'Dzuhr',
        time: '1:30',
        icon: Icons.wb_sunny,
        colors: [Colors.blue.shade300, Colors.blue.shade600],
      ),
      PrayerTime(
        label: 'Asr',
        time: '4:45',
        icon: Icons.wb_sunny_outlined,
        colors: [Colors.deepOrange.shade300, Colors.deepOrange.shade600],
      ),
      PrayerTime(
        label: 'Maghrib',
        time: '5:36',
        icon: Icons.nightlight_round,
        colors: [Colors.red.shade300, Colors.red.shade600],
      ),
      PrayerTime(
        label: 'Isha',
        time: '7:45',
        icon: Icons.brightness_3,
        colors: [Colors.teal.shade300, Colors.teal.shade600],
      ),
    ];
  }
}
