import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/prayer_provider.dart';
import '../widgets/header_section.dart';
import '../widgets/prayer_times_section.dart';
import '../widgets/menu_grid_section.dart';
import '../widgets/last_read_section.dart';
import '../widgets/prayer_tracker_section.dart';

class PrayerDashboardPage extends StatefulWidget {
  const PrayerDashboardPage({super.key});

  @override
  State<PrayerDashboardPage> createState() => _PrayerDashboardPageState();
}

class _PrayerDashboardPageState extends State<PrayerDashboardPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() => context.read<PrayerProvider>().fetchPrayerTimes());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0B1F2A),
      body: Stack(
        children: [
          const HeaderSection(),
          DraggableScrollableSheet(
            initialChildSize: 0.62,
            minChildSize: 0.62,
            maxChildSize: 0.95,
            builder: (context, scrollController) {
              return Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                ),
                child: ListView(
                  controller: scrollController,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 32,
                  ),
                  children: const [
                    PrayerTimesSection(),
                    SizedBox(height: 32),
                    MenuGridSection(),
                    SizedBox(height: 32),
                    LastReadSection(),
                    SizedBox(height: 32),
                    PrayerTrackerSection(),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
