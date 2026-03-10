import 'package:flutter/material.dart';
import 'menu_item.dart';
import '../../../../features/prayer_schedule/presentation/pages/prayer_schedule_page.dart';

class MenuGridSection extends StatelessWidget {
  const MenuGridSection({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> menuItems = [
      {'label': 'Quran', 'icon': Icons.menu_book},
      {'label': 'Hijri', 'icon': Icons.calendar_month},
      {'label': 'Qibla', 'icon': Icons.explore},
      {'label': 'Tasbeeh', 'icon': Icons.radio_button_checked},
      {'label': 'Calendar', 'icon': Icons.calendar_today},
      {'label': 'Dua', 'icon': Icons.front_hand},
      {'label': 'Hadith', 'icon': Icons.history_edu},
      {'label': 'Salah', 'icon': Icons.access_time_filled},
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 5,
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
        childAspectRatio: 0.85,
      ),
      itemCount: menuItems.length,
      itemBuilder: (context, index) {
        final item = menuItems[index];
        return InkWell(
          onTap: () {
            if (item['label'] == 'Salah') {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const PrayerSchedulePage(),
                ),
              );
            }
          },
          child: MenuItem(label: item['label'], icon: item['icon']),
        );
      },
    );
  }
}
