import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import '../../../../core/services/location_service.dart';
import '../../domain/entities/prayer_schedule.dart';
import '../../domain/repositories/prayer_schedule_repository.dart';

class PrayerScheduleProvider extends ChangeNotifier {
  final PrayerScheduleRepository repository;

  PrayerSchedule? _schedule;
  bool _isLoading = false;
  DateTime _selectedDate = DateTime.now();
  Position? _currentPosition;

  PrayerScheduleProvider({required this.repository});

  PrayerSchedule? get schedule => _schedule;
  bool get isLoading => _isLoading;
  DateTime get selectedDate => _selectedDate;

  Future<void> init() async {
    await _fetchLocation();
    await fetchSchedule(_selectedDate);
  }

  Future<void> _fetchLocation() async {
    _currentPosition = await LocationService.getCurrentLocation();
  }

  Future<void> fetchSchedule(DateTime date) async {
    _selectedDate = date;
    _isLoading = true;
    notifyListeners();

    if (_currentPosition == null) {
      await _fetchLocation();
    }

    if (_currentPosition != null) {
      _schedule = await repository.getPrayerSchedule(
        date,
        _currentPosition!.latitude,
        _currentPosition!.longitude,
      );
    }

    _isLoading = false;
    notifyListeners();
  }

  void selectDate(DateTime date) {
    fetchSchedule(date);
  }
}
