import '../entities/prayer_schedule.dart';

abstract class PrayerScheduleRepository {
  Future<PrayerSchedule> getPrayerSchedule(
    DateTime date,
    double lat,
    double lng,
  );
}
