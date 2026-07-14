import 'package:flutter/material.dart';
import 'package:tarassul_new/core/theme/colors/app_colors.dart';
import 'package:tarassul_new/core/theme/styles/app_text_style.dart';
import 'package:tarassul_new/core/widgets/secondappbar/second_app_bar.dart';

/// Contact Us Screen
/// Quick channels to reach the company: hotline, email, social, address.
class ContactUsScreen extends StatelessWidget {
  const ContactUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: SecondaryAppBar(title: 'تواصل معنا'),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _ContactTile(
            icon: Icons.call_rounded,
            iconColor: AppColors.primary,
            iconBackground: AppColors.primaryContainer,
            title: 'الخط الساخن',
            subtitle: '155',
            onTap: () {
              // TODO: launch dialer, e.g. url_launcher -> tel:155
            },
          ),
          const SizedBox(height: 12),
          _ContactTile(
            icon: Icons.email_rounded,
            iconColor: AppColors.secondary,
            iconBackground: AppColors.secondaryContainer,
            title: 'البريد الإلكتروني',
            subtitle: 'support@syriatel-example.sy',
            onTap: () {
              // TODO: launch mail client
            },
          ),
          const SizedBox(height: 12),
          _ContactTile(
            icon: Icons.location_on_rounded,
            iconColor: AppColors.primary,
            iconBackground: AppColors.primaryContainer,
            title: 'المركز الرئيسي',
            subtitle: 'دمشق - ساحة الأمويين',
            onTap: () {
              // TODO: open maps
            },
          ),
          const SizedBox(height: 24),
          Text(
            'تابعنا على',
            textDirection: TextDirection.rtl,
            style: AppTextStyles.titleMedium.copyWith(
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: 12),
          Row(
            textDirection: TextDirection.rtl,
            children: [
              _SocialButton(icon: Icons.facebook_rounded, onTap: () {}),
              const SizedBox(width: 12),
              _SocialButton(icon: Icons.camera_alt_rounded, onTap: () {}),
              const SizedBox(width: 12),
              _SocialButton(icon: Icons.alternate_email_rounded, onTap: () {}),
            ],
          ),
        ],
      ),
    );
  }
}

class _ContactTile extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final Color iconBackground;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  const _ContactTile({
    required this.icon,
    required this.iconColor,
    required this.iconBackground,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(16),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
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
                  color: iconBackground,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(icon, color: iconColor, size: 22),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  textDirection: TextDirection.rtl,
                  children: [
                    Text(
                      title,
                      textDirection: TextDirection.rtl,
                      style: AppTextStyles.titleMedium
                          .copyWith(color: AppColors.textPrimary),
                    ),
                    const SizedBox(height: 3),
                    Text(
                      subtitle,
                      textDirection: TextDirection.ltr,
                      style: AppTextStyles.bodySmall
                          .copyWith(color: AppColors.textSecondary),
                    ),
                  ],
                ),
              ),
              Icon(Icons.chevron_left_rounded,
                  color: AppColors.gray400, size: 20),
            ],
          ),
        ),
      ),
    );
  }
}

class _SocialButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const _SocialButton({required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.primaryContainer,
      shape: const CircleBorder(),
      child: InkWell(
        customBorder: const CircleBorder(),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Icon(icon, color: AppColors.primary, size: 22),
        ),
      ),
    );
  }
}
