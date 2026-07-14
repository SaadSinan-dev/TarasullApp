import 'package:flutter/material.dart';
import 'package:tarassul_new/core/theme/colors/app_colors.dart';
import 'package:tarassul_new/core/theme/styles/app_text_style.dart';

class AppBody extends StatelessWidget {
  final String subscriberName;
  final String subscriberNumber;
  final String registrationDate;
  final String chargeType;
  final String subscriberStatus;
  final String fixedAddress;

  final String packageName;
  final double usedDataGb;
  final double totalDataGb;
  final String validUntil;

  const AppBody({
    super.key,
    this.subscriberName = 'اسم المستخدم',
    this.subscriberNumber = '09xxx xxx xxx',
    this.registrationDate = '12 / 03 / 2022',
    this.chargeType = 'مسبق الدفع',
    this.subscriberStatus = 'فعال',
    this.fixedAddress = '00.00.00.00',
    this.packageName = 'باقة الإنترنت الشهرية',
    this.usedDataGb = 14.5,
    this.totalDataGb = 200,
    this.validUntil = '30 / 07 / 2026',
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _SubscriberInfoCard(
            subscriberName: subscriberName,
            subscriberNumber: subscriberNumber,
            registrationDate: registrationDate,
            chargeType: chargeType,
            subscriberStatus: subscriberStatus,
            fixedAddress: fixedAddress,
          ),
          const SizedBox(height: 20),
          Text(
            'الباقات',
            textDirection: TextDirection.rtl,
            style: AppTextStyles.headlineSmall.copyWith(
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: 12),
          _PackageCard(
            packageName: packageName,
            usedDataGb: usedDataGb,
            totalDataGb: totalDataGb,
            validUntil: validUntil,
          ),
          SizedBox(
            height: 150,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 15,
                height: 15,
                decoration: BoxDecoration(
                    shape: BoxShape.circle, color: AppColors.primary),
              ),
              SizedBox(
                width: 12,
              ),
              Container(
                width: 15,
                height: 15,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.primary.withOpacity(0.5)),
              ),
              SizedBox(
                width: 12,
              ),
              Container(
                width: 15,
                height: 15,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.primary.withOpacity(0.2)),
              )
            ],
          )
        ],
      ),
    );
  }
}

class _SubscriberInfoCard extends StatelessWidget {
  final String subscriberName;
  final String subscriberNumber;
  final String registrationDate;
  final String chargeType;
  final String subscriberStatus;
  final String fixedAddress;

  const _SubscriberInfoCard({
    required this.subscriberName,
    required this.subscriberNumber,
    required this.registrationDate,
    required this.chargeType,
    required this.subscriberStatus,
    required this.fixedAddress,
  });

  Color get _statusColor {
    switch (subscriberStatus) {
      case 'فعال':
        return AppColors.success;
      case 'موقوف':
        return AppColors.warning;
      default:
        return AppColors.error;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: AppColors.gray300.withOpacity(0.4),
            blurRadius: 16,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [AppColors.primary, AppColors.secondaryLight],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            child: Row(
              textDirection: TextDirection.rtl,
              children: [
                CircleAvatar(
                  radius: 26,
                  backgroundColor: Colors.white,
                  child: Icon(Icons.person_rounded,
                      color: AppColors.primary, size: 28),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    textDirection: TextDirection.rtl,
                    children: [
                      Text(
                        subscriberName,
                        textDirection: TextDirection.rtl,
                        style: AppTextStyles.titleLarge.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        subscriberNumber,
                        style: AppTextStyles.bodySmall.copyWith(
                          color: Colors.white.withOpacity(0.85),
                        ),
                      ),
                    ],
                  ),
                ),
                _StatusBadge(label: subscriberStatus, color: _statusColor),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(18),
            child: Column(
              children: [
                _InfoRow(
                  icon: Icons.calendar_today_rounded,
                  label: 'تاريخ التسجيل',
                  value: registrationDate,
                ),
                const _InfoDivider(),
                _InfoRow(
                  icon: Icons.payments_rounded,
                  label: 'نوع الشحن',
                  value: chargeType,
                ),
                const _InfoDivider(),
                _InfoRow(
                  icon: Icons.location_on_rounded,
                  label: 'العنوان الثابت',
                  value: fixedAddress,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _StatusBadge extends StatelessWidget {
  final String label;
  final Color color;

  const _StatusBadge({required this.label, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.95),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        textDirection: TextDirection.rtl,
        children: [
          Container(
            width: 8,
            height: 8,
            decoration: BoxDecoration(color: color, shape: BoxShape.circle),
          ),
          const SizedBox(width: 6),
          Text(
            label,
            textDirection: TextDirection.rtl,
            style: AppTextStyles.bodySmall.copyWith(
              color: AppColors.textPrimary,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const _InfoRow({
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      textDirection: TextDirection.rtl,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 38,
          height: 38,
          decoration: BoxDecoration(
            color: AppColors.primaryContainer,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(icon, color: AppColors.primary, size: 18),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            textDirection: TextDirection.rtl,
            children: [
              Text(
                label,
                textDirection: TextDirection.rtl,
                style: AppTextStyles.bodySmall.copyWith(
                  color: AppColors.textSecondary,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                value,
                textDirection: TextDirection.rtl,
                style: AppTextStyles.titleMedium.copyWith(
                  color: AppColors.textPrimary,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _InfoDivider extends StatelessWidget {
  const _InfoDivider();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Divider(color: AppColors.divider, height: 1),
    );
  }
}

class _PackageCard extends StatelessWidget {
  final String packageName;
  final double usedDataGb;
  final double totalDataGb;
  final String validUntil;

  const _PackageCard({
    required this.packageName,
    required this.usedDataGb,
    required this.totalDataGb,
    required this.validUntil,
  });

  double get _progress =>
      totalDataGb == 0 ? 0 : (usedDataGb / totalDataGb).clamp(0, 1);

  double get _remainingGb => (totalDataGb - usedDataGb).clamp(0, totalDataGb);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: AppColors.gray300.withOpacity(0.4),
            blurRadius: 16,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            textDirection: TextDirection.rtl,
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: AppColors.primaryContainer,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(Icons.sim_card_rounded,
                    color: AppColors.primary, size: 18),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  packageName,
                  textDirection: TextDirection.rtl,
                  style: AppTextStyles.titleLarge.copyWith(
                    color: AppColors.textPrimary,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 18),

          // ---- Row: Usage gauge (right) + details (left) ----
          Row(
            textDirection: TextDirection.rtl,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Usage circular indicator
              SizedBox(
                width: 88,
                height: 88,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    SizedBox(
                      width: 88,
                      height: 88,
                      child: CircularProgressIndicator(
                        value: _progress,
                        strokeWidth: 14,
                        backgroundColor: AppColors.gray100,
                        valueColor: AlwaysStoppedAnimation<Color>(
                          _progress > 0.85
                              ? AppColors.error
                              : AppColors.primary,
                        ),
                      ),
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          '${(_progress * 100).toStringAsFixed(0)}%',
                          style: AppTextStyles.titleMedium.copyWith(
                            color: AppColors.textPrimary,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'مستخدم',
                          textDirection: TextDirection.rtl,
                          style: AppTextStyles.bodySmall.copyWith(
                            color: AppColors.textHint,
                            fontSize: 10,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 18),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  textDirection: TextDirection.rtl,
                  children: [
                    _PackageDetailRow(
                      icon: Icons.sd_storage_rounded,
                      label: 'حجم الباقة',
                      value: '${totalDataGb.toStringAsFixed(0)} GB',
                    ),
                    const SizedBox(height: 10),
                    _PackageDetailRow(
                      icon: Icons.data_usage_rounded,
                      label: 'المتبقي',
                      value: '${_remainingGb.toStringAsFixed(1)} GB',
                    ),
                    const SizedBox(height: 10),
                    _PackageDetailRow(
                      icon: Icons.event_available_rounded,
                      label: 'صالحة لغاية',
                      value: validUntil,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _PackageDetailRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const _PackageDetailRow({
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      textDirection: TextDirection.rtl,
      children: [
        Icon(icon, size: 16, color: AppColors.gray500),
        const SizedBox(width: 6),
        Text(
          '$label:',
          textDirection: TextDirection.rtl,
          style: AppTextStyles.bodySmall.copyWith(
            color: AppColors.textSecondary,
          ),
        ),
        const SizedBox(width: 4),
        Expanded(
          child: Text(
            value,
            textDirection: TextDirection.rtl,
            style: AppTextStyles.bodyMedium.copyWith(
              color: AppColors.textPrimary,
              fontWeight: FontWeight.w600,
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
