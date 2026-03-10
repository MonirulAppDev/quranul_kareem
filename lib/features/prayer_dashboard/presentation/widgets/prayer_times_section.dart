import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/prayer_provider.dart';
import 'prayer_time_tile.dart';

class PrayerTimesSection extends StatelessWidget {
  const PrayerTimesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<PrayerProvider>(
      builder: (context, provider, child) {
        if (provider.isLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        if (provider.prayerTimes.isEmpty) {
          return const SizedBox.shrink();
        }
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: provider.prayerTimes
              .map((pt) => PrayerTimeTile(prayerTime: pt))
              .toList(),
        );
      },
    );
  }
}
