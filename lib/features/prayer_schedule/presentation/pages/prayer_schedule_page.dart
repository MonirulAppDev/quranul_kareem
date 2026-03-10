import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:easy_date_timeline/easy_date_timeline.dart';
import '../provider/prayer_schedule_provider.dart';

class PrayerSchedulePage extends StatelessWidget {
  const PrayerSchedulePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        toolbarHeight: 56,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black, size: 18),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Date and Time',
          style: GoogleFonts.inter(
            color: const Color(0xFF1E293B),
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        centerTitle: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
        ),
      ),
      body: Consumer<PrayerScheduleProvider>(
        builder: (context, provider, child) {
          if (provider.isLoading && provider.schedule == null) {
            return const Center(child: CircularProgressIndicator());
          }

          return Column(
            children: [
              const SizedBox(height: 12),
              _buildDateTimeline(provider),
              const SizedBox(height: 16),
              Expanded(child: _buildPrayerList(provider)),
            ],
          );
        },
      ),
    );
  }

  Widget _buildDateTimeline(PrayerScheduleProvider provider) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
      margin: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(5),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                constraints: const BoxConstraints(),
                padding: EdgeInsets.zero,
                icon: const Icon(
                  Icons.chevron_left,
                  color: Colors.black54,
                  size: 24,
                ),
                onPressed: () {
                  provider.selectDate(
                    provider.selectedDate.subtract(const Duration(days: 1)),
                  );
                },
              ),
              Text(
                _formatFullDate(provider.selectedDate),
                style: GoogleFonts.inter(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF1E293B),
                ),
              ),
              IconButton(
                constraints: const BoxConstraints(),
                padding: EdgeInsets.zero,
                icon: const Icon(
                  Icons.chevron_right,
                  color: Colors.black54,
                  size: 24,
                ),
                onPressed: () {
                  provider.selectDate(
                    provider.selectedDate.add(const Duration(days: 1)),
                  );
                },
              ),
            ],
          ),
          const SizedBox(height: 8),
          EasyDateTimeLine(
            initialDate: provider.selectedDate,
            onDateChange: (selectedDate) {
              provider.selectDate(selectedDate);
            },
            headerProps: const EasyHeaderProps(showMonthPicker: false),
            dayProps: EasyDayProps(
              height: 70,
              width: 50,
              dayStructure: DayStructure.dayStrDayNum,
              activeDayStyle: DayStyle(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(16)),
                  border: Border.all(color: const Color(0xFF1B5E20), width: 1),
                ),
                dayNumStyle: GoogleFonts.inter(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF1B5E20),
                ),
                dayStrStyle: GoogleFonts.inter(
                  fontSize: 10,
                  fontWeight: FontWeight.w400,
                  color: const Color(0xFF1B5E20),
                ),
              ),
              inactiveDayStyle: DayStyle(
                dayNumStyle: GoogleFonts.inter(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Colors.black38,
                ),
                dayStrStyle: GoogleFonts.inter(
                  fontSize: 10,
                  fontWeight: FontWeight.w400,
                  color: Colors.black38,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPrayerList(PrayerScheduleProvider provider) {
    if (provider.schedule == null) {
      return const Center(child: Text('No schedule available'));
    }

    return ListView.separated(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      itemCount: provider.schedule!.prayerTimes.length,
      separatorBuilder: (_, __) => const SizedBox(height: 10),
      itemBuilder: (context, index) {
        final prayer = provider.schedule!.prayerTimes[index];
        return _PrayerTimeCard(prayer: prayer);
      },
    );
  }

  String _formatFullDate(DateTime date) {
    final months = [
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December',
    ];
    return '${date.day} ${months[date.month - 1]} ${date.year}';
  }
}

class _PrayerTimeCard extends StatelessWidget {
  final dynamic prayer;

  const _PrayerTimeCard({required this.prayer});

  @override
  Widget build(BuildContext context) {
    bool isActive = prayer.isActive;
    return Container(
      decoration: BoxDecoration(
        color: isActive ? const Color(0xFF1B5E20) : Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          if (!isActive)
            BoxShadow(
              color: Colors.black.withAlpha(5),
              blurRadius: 6,
              offset: const Offset(0, 2),
            ),
        ],
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: isActive
                  ? Colors.white.withAlpha(40)
                  : const Color(0xFFF1F5F9),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(
              prayer.icon,
              color: isActive ? Colors.white : Colors.black54,
              size: 20,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              prayer.label,
              style: GoogleFonts.inter(
                fontSize: 15,
                fontWeight: FontWeight.w600,
                color: isActive ? Colors.white : const Color(0xFF1E293B),
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const SizedBox(width: 8),
          Text(
            prayer.time,
            style: GoogleFonts.inter(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: isActive ? Colors.white : Colors.black54,
            ),
          ),
        ],
      ),
    );
  }
}
