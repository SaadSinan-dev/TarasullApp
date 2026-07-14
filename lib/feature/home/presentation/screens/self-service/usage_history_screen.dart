import 'package:flutter/material.dart';
import 'package:tarassul_new/core/theme/colors/app_colors.dart';
import 'package:tarassul_new/core/theme/styles/app_text_style.dart';
import 'package:tarassul_new/core/widgets/secondappbar/second_app_bar.dart';

/// Usage History Screen
/// Shows a chronological list of the subscriber's data/call usage.
class UsageHistoryScreen extends StatelessWidget {
  const UsageHistoryScreen({super.key});

  // TODO: Replace with real data from your repository/Bloc.
  static final List<_UsageEntry> _mockEntries = [
    _UsageEntry(
        date: '13 / 07 / 2026', label: 'استخدام إنترنت', value: '1.2 GB'),
    _UsageEntry(
        date: '12 / 07 / 2026', label: 'استخدام إنترنت', value: '0.8 GB'),
    _UsageEntry(
        date: '11 / 07 / 2026', label: 'مكالمات محلية', value: '24 دقيقة'),
    _UsageEntry(
        date: '10 / 07 / 2026', label: 'استخدام إنترنت', value: '2.1 GB'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: SecondaryAppBar(title: 'سجل الاستخدام'),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: _mockEntries.length,
        separatorBuilder: (_, __) => const SizedBox(height: 10),
        itemBuilder: (context, index) {
          final entry = _mockEntries[index];
          return Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(14),
              boxShadow: [
                BoxShadow(
                  color: AppColors.gray300.withOpacity(0.3),
                  blurRadius: 8,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Row(
              textDirection: TextDirection.rtl,
              children: [
                Container(
                  width: 38,
                  height: 38,
                  decoration: BoxDecoration(
                    color: AppColors.primaryContainer,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(Icons.data_usage_rounded,
                      color: AppColors.primary, size: 18),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    textDirection: TextDirection.rtl,
                    children: [
                      Text(
                        entry.label,
                        textDirection: TextDirection.rtl,
                        style: AppTextStyles.titleMedium
                            .copyWith(color: AppColors.textPrimary),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        entry.date,
                        style: AppTextStyles.bodySmall
                            .copyWith(color: AppColors.textHint),
                      ),
                    ],
                  ),
                ),
                Text(
                  entry.value,
                  textDirection: TextDirection.rtl,
                  style: AppTextStyles.titleMedium.copyWith(
                    color: AppColors.secondary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class _UsageEntry {
  final String date;
  final String label;
  final String value;

  _UsageEntry({required this.date, required this.label, required this.value});
}
