import 'package:adhan/adhan.dart';
import '../../domain/entities/prayer_schedule.dart';
import '../../domain/repositories/prayer_schedule_repository.dart';
import 'package:flutter/material.dart';

class PrayerScheduleRepositoryImpl implements PrayerScheduleRepository {
  @override
  Future<PrayerSchedule> getPrayerSchedule(
    DateTime date,
    double lat,
    double lng,
  ) {
    final coordinates = Coordinates(lat, lng);
    final params = CalculationMethod.karachi.getParameters();
    params.madhab = Madhab.hanafi;

    final prayerTimes = PrayerTimes(
      coordinates,
      DateComponents.from(date),
      params,
    );

    return Future.value(
      PrayerSchedule(
        date: date,
        prayerTimes: [
          PrayerTimeDetail(
            label: 'Fajr',
            time: _formatTime(prayerTimes.fajr),
            icon: Icons.wb_twilight,
            isActive: _isCurrent(prayerTimes.fajr, prayerTimes.sunrise),
          ),
          PrayerTimeDetail(
            label: 'Subuh',
            time: _formatTime(
              prayerTimes.fajr,
            ), // Subuh is often used interchangeably with Fajr
            icon: Icons.wb_twilight,
          ),
          PrayerTimeDetail(
            label: 'Dzuhur',
            time: _formatTime(prayerTimes.dhuhr),
            icon: Icons.wb_sunny,
          ),
          PrayerTimeDetail(
            label: 'Asr',
            time: _formatTime(prayerTimes.asr),
            icon: Icons.cloud,
          ),
          PrayerTimeDetail(
            label: 'Maghrib',
            time: _formatTime(prayerTimes.maghrib),
            icon: Icons.wb_twilight,
          ),
          PrayerTimeDetail(
            label: 'Isha',
            time: _formatTime(prayerTimes.isha),
            icon: Icons.brightness_2,
          ),
          PrayerTimeDetail(
            label: 'Mid-night',
            time: _formatTime(
              prayerTimes.isha.add(const Duration(hours: 4)),
            ), // Rough estimate
            icon: Icons.nights_stay,
          ),
        ],
      ),
    );
  }

  String _formatTime(DateTime time) {
    int hour = time.hour;
    int minute = time.minute;
    String period = hour >= 12 ? 'PM' : 'AM';
    hour = hour % 12;
    if (hour == 0) hour = 12;
    String minuteStr = minute < 10 ? '0$minute' : '$minute';
    return '$hour:$minuteStr $period';
  }

  bool _isCurrent(DateTime start, DateTime end) {
    final now = DateTime.now();
    return now.isAfter(start) && now.isBefore(end);
  }
}
