import 'package:adhan/adhan.dart';
import '../../features/prayer_dashboard/domain/entities/prayer_time.dart';
import 'package:flutter/material.dart';

class PrayerService {
  static List<PrayerTime> getPrayerTimes(
    double lat,
    double lng,
    DateTime date,
  ) {
    final coordinates = Coordinates(lat, lng);
    final params = CalculationMethod.karachi.getParameters();
    params.madhab = Madhab.hanafi;

    final prayerTimes = PrayerTimes(
      coordinates,
      DateComponents.from(date),
      params,
    );

    return [
      PrayerTime(
        label: 'Fajr',
        time: _formatTime(prayerTimes.fajr),
        icon: Icons.wb_twilight,
        colors: [Colors.orange.shade300, Colors.orange.shade600],
      ),
      PrayerTime(
        label: 'Sunrise',
        time: _formatTime(prayerTimes.sunrise),
        icon: Icons.wb_sunny_outlined,
        colors: [Colors.yellow.shade400, Colors.orange.shade400],
      ),
      PrayerTime(
        label: 'Dzuhr',
        time: _formatTime(prayerTimes.dhuhr),
        icon: Icons.wb_sunny,
        colors: [Colors.blue.shade300, Colors.blue.shade600],
      ),
      PrayerTime(
        label: 'Asr',
        time: _formatTime(prayerTimes.asr),
        icon: Icons.wb_sunny_outlined,
        colors: [Colors.deepOrange.shade300, Colors.deepOrange.shade600],
      ),
      PrayerTime(
        label: 'Maghrib',
        time: _formatTime(prayerTimes.maghrib),
        icon: Icons.nightlight_round,
        colors: [Colors.red.shade300, Colors.red.shade600],
      ),
      PrayerTime(
        label: 'Isha',
        time: _formatTime(prayerTimes.isha),
        icon: Icons.brightness_3,
        colors: [Colors.teal.shade300, Colors.teal.shade600],
      ),
    ];
  }

  static String _formatTime(DateTime time) {
    int hour = time.hour;
    int minute = time.minute;
    String period = hour >= 12 ? 'PM' : 'AM';
    hour = hour % 12;
    if (hour == 0) hour = 12;
    String minuteStr = minute < 10 ? '0$minute' : '$minute';
    return '$hour:$minuteStr $period';
  }
}
