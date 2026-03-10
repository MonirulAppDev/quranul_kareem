import '../entities/prayer_time.dart';

abstract class PrayerRepository {
  Future<List<PrayerTime>> getPrayerTimes();
}
