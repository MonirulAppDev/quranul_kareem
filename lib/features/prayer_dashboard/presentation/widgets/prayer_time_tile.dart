import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../domain/entities/prayer_time.dart';

class PrayerTimeTile extends StatelessWidget {
  final PrayerTime prayerTime;

  const PrayerTimeTile({super.key, required this.prayerTime});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          prayerTime.label,
          style: GoogleFonts.inter(
            fontWeight: FontWeight.w600,
            fontSize: 15,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 12),
        Container(
          height: 56,
          width: 56,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: prayerTime.colors,
            ),
            boxShadow: [
              BoxShadow(
                color: prayerTime.colors.last.withAlpha(77),
                blurRadius: 12,
                offset: const Offset(0, 6),
              ),
            ],
          ),
          child: Icon(prayerTime.icon, color: Colors.white, size: 28),
        ),
        const SizedBox(height: 12),
        Text(
          prayerTime.time,
          style: GoogleFonts.inter(
            fontWeight: FontWeight.bold,
            fontSize: 16,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}
