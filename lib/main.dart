import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'core/theme/app_theme.dart';
import 'features/prayer_dashboard/data/repositories/prayer_repository_impl.dart';
import 'features/prayer_dashboard/presentation/pages/prayer_dashboard_page.dart';
import 'features/prayer_dashboard/presentation/provider/prayer_provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => PrayerProvider(repository: PrayerRepositoryImpl()),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quranul Kareem',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: const PrayerDashboardPage(),
    );
  }
}
