import 'package:flutter/material.dart';
import 'package:tarassul_new/core/theme/colors/app_colors.dart';
import 'package:tarassul_new/core/theme/styles/app_text_style.dart';
import 'package:tarassul_new/core/widgets/secondappbar/second_app_bar.dart';

/// About Screen
/// Company description + app version info.
class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: SecondaryAppBar(title: 'من نحن؟'),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Center(
            child: Container(
              width: 84,
              height: 84,
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: AppColors.primaryContainer,
                shape: BoxShape.circle,
              ),
              child: Image.asset(
                'assets/images/logo.png',
                fit: BoxFit.contain,
                errorBuilder: (context, error, stackTrace) => Icon(
                  Icons.phone_in_talk_rounded,
                  color: AppColors.primary,
                  size: 38,
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
          Center(
            child: Text(
              'السورية للاتصالات',
              textDirection: TextDirection.rtl,
              style: AppTextStyles.headlineMedium
                  .copyWith(color: AppColors.textPrimary),
            ),
          ),
          const SizedBox(height: 4),
          Center(
            child: Text(
              'الإصدار 1.0.0',
              style:
                  AppTextStyles.bodySmall.copyWith(color: AppColors.textHint),
            ),
          ),
          const SizedBox(height: 28),
          Text(
            'عن الشركة',
            textDirection: TextDirection.rtl,
            style:
                AppTextStyles.titleLarge.copyWith(color: AppColors.textPrimary),
          ),
          const SizedBox(height: 10),
          Text(
            'مؤسسة السورية للاتصالات هي المزود الرسمي لخدمات الاتصالات الثابتة والإنترنت '
            'في الجمهورية العربية السورية، وتعمل على تطوير بنيتها التحتية باستمرار '
            'لتقديم أفضل تجربة ممكنة للمشتركين.',
            textDirection: TextDirection.rtl,
            textAlign: TextAlign.right,
            style: AppTextStyles.bodyMedium.copyWith(
              color: AppColors.textSecondary,
              height: 1.7,
            ),
          ),
          const SizedBox(height: 28),
          _LinkRow(
            icon: Icons.description_outlined,
            label: 'شروط الاستخدام',
            onTap: () {
              // TODO: Navigate to Terms screen or open URL
            },
          ),
          const SizedBox(height: 4),
          _LinkRow(
            icon: Icons.privacy_tip_outlined,
            label: 'سياسة الخصوصية',
            onTap: () {
              // TODO: Navigate to Privacy Policy screen or open URL
            },
          ),
        ],
      ),
    );
  }
}

class _LinkRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const _LinkRow({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: Row(
            textDirection: TextDirection.rtl,
            children: [
              Icon(icon, color: AppColors.gray600, size: 20),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  label,
                  textDirection: TextDirection.rtl,
                  style: AppTextStyles.bodyMedium
                      .copyWith(color: AppColors.textPrimary),
                ),
              ),
              Icon(Icons.chevron_left_rounded,
                  color: AppColors.gray400, size: 18),
            ],
          ),
        ),
      ),
    );
  }
}
