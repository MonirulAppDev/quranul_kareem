import 'package:flutter/material.dart';
import '../../domain/entities/prayer_time.dart';
import '../../domain/repositories/prayer_repository.dart';

class PrayerProvider extends ChangeNotifier {
  final PrayerRepository repository;
  List<PrayerTime> _prayerTimes = [];
  bool _isLoading = false;

  PrayerProvider({required this.repository});

  List<PrayerTime> get prayerTimes => _prayerTimes;
  bool get isLoading => _isLoading;

  Future<void> fetchPrayerTimes() async {
    _isLoading = true;
    notifyListeners();
    _prayerTimes = await repository.getPrayerTimes();
    _isLoading = false;
    notifyListeners();
  }
}
