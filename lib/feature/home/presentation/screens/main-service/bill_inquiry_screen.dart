import 'package:flutter/material.dart';
import 'package:tarassul_new/core/theme/colors/app_colors.dart';
import 'package:tarassul_new/core/theme/styles/app_text_style.dart';
import 'package:tarassul_new/core/widgets/secondappbar/second_app_bar.dart';

class BillinquiryScreen extends StatelessWidget {
  const BillinquiryScreen({super.key});

  static final List<_Bill> _mockBills = [
    _Bill(month: 'حزيران 2026', amount: 45000, status: _BillStatus.paid),
    _Bill(month: 'أيار 2026', amount: 42500, status: _BillStatus.paid),
    _Bill(month: 'نيسان 2026', amount: 48000, status: _BillStatus.due),
    _Bill(month: 'آذار 2026', amount: 41000, status: _BillStatus.paid),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: SecondaryAppBar(title: 'الفواتير'),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: _mockBills.length,
        separatorBuilder: (_, __) => const SizedBox(height: 12),
        itemBuilder: (context, index) => _BillCard(bill: _mockBills[index]),
      ),
    );
  }
}

enum _BillStatus { paid, due }

class _Bill {
  final String month;
  final int amount; // SYP
  final _BillStatus status;

  _Bill({required this.month, required this.amount, required this.status});
}

class _BillCard extends StatelessWidget {
  final _Bill bill;

  const _BillCard({required this.bill});

  Color get _statusColor =>
      bill.status == _BillStatus.paid ? AppColors.success : AppColors.warning;

  String get _statusLabel =>
      bill.status == _BillStatus.paid ? 'مدفوعة' : 'مستحقة';

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: AppColors.gray300.withOpacity(0.35),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        textDirection: TextDirection.rtl,
        children: [
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: AppColors.primaryContainer,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(Icons.receipt_long_rounded,
                color: AppColors.primary, size: 22),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              textDirection: TextDirection.rtl,
              children: [
                Text(
                  bill.month,
                  textDirection: TextDirection.rtl,
                  style: AppTextStyles.titleMedium.copyWith(
                    color: AppColors.textPrimary,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  '${bill.amount} ل.س',
                  style: AppTextStyles.bodySmall.copyWith(
                    color: AppColors.textSecondary,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: BoxDecoration(
              color: _statusColor.withOpacity(0.12),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              _statusLabel,
              textDirection: TextDirection.rtl,
              style: AppTextStyles.bodySmall.copyWith(
                color: _statusColor,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
