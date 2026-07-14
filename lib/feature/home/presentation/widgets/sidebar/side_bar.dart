import 'package:flutter/material.dart';
import 'package:tarassul_new/core/routing/app_routes.dart';
import 'package:tarassul_new/core/theme/colors/app_colors.dart';
import 'package:tarassul_new/core/theme/styles/app_text_style.dart';

class SideBar extends StatelessWidget {
  const SideBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.background,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24),
          bottomLeft: Radius.circular(24),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildHeader(context),
          const SizedBox(height: 8),
          Expanded(
            child: SafeArea(
              top: false,
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                children: [
                  _DrawerItem(
                    icon: Icons.receipt_long_rounded,
                    label: 'استعلام عن الفواتير',
                    iconColor: AppColors.primary,
                    iconBackground: AppColors.primaryContainer,
                    onTap: () {
                      Navigator.pushNamed(context, AppRoutes.billInquiry);
                    },
                  ),
                  _DrawerItem(
                    icon: Icons.router_rounded,
                    label: 'البوابات الشاغرة',
                    iconColor: AppColors.primary,
                    iconBackground: AppColors.primaryContainer,
                    onTap: () {
                      Navigator.pushNamed(context, AppRoutes.availablePorts);
                    },
                  ),
                  _DrawerExpansionItem(
                    icon: Icons.person_pin_circle_rounded,
                    label: 'الخدمة الذاتية',
                    iconColor: AppColors.primary,
                    iconBackground: AppColors.primaryContainer,
                    children: [
                      _DrawerSubItem(
                        icon: Icons.history_rounded,
                        label: 'سجل الاستخدام',
                        onTap: () {
                          Navigator.pushNamed(context, AppRoutes.usageHistory);
                        },
                      ),
                      _DrawerSubItem(
                        icon: Icons.add_shopping_cart_rounded,
                        label: 'شراء حجوم إضافية',
                        onTap: () {
                          Navigator.pushNamed(context, AppRoutes.buyExtraData);
                        },
                      ),
                      _DrawerSubItem(
                        icon: Icons.lock_reset_rounded,
                        label: 'تغيير كلمة المرور',
                        onTap: () {
                          Navigator.pop(context);
                          Navigator.pushNamed(
                              context, AppRoutes.changePassword);
                        },
                      ),
                    ],
                  ),
                  _DrawerItem(
                    icon: Icons.headset_mic_rounded,
                    label: 'تواصل معنا',
                    iconColor: AppColors.primary,
                    iconBackground: AppColors.primaryContainer,
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.pushNamed(context, AppRoutes.contactUs);
                    },
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 8),
                    child: Divider(color: AppColors.divider, height: 1),
                  ),
                  _DrawerItem(
                    icon: Icons.info_outline_rounded,
                    label: 'حول التطبيق',
                    iconColor: AppColors.gray600,
                    iconBackground: AppColors.gray100,
                    onTap: () {
                      Navigator.pushNamed(context, AppRoutes.about);
                    },
                  ),
                  _DrawerItem(
                    icon: Icons.logout,
                    label: 'تسجيل الخروج',
                    iconColor: AppColors.error,
                    iconBackground: AppColors.error.withOpacity(0.3),
                    onTap: () {
                      Navigator.pushReplacementNamed(context, AppRoutes.login);
                    },
                  ),
                ],
              ),
            ),
          ),
          SafeArea(top: false, child: _buildFooter()),
        ],
      ),
    );
  }
}

Widget _buildHeader(BuildContext context) {
  final topPadding = MediaQuery.of(context).padding.top;
  return Container(
    width: double.infinity,
    padding: EdgeInsets.fromLTRB(20, topPadding + 20, 20, 24),
    decoration: BoxDecoration(
      gradient: LinearGradient(
        colors: [AppColors.primary, AppColors.secondaryLight],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
      borderRadius: const BorderRadius.only(
        bottomLeft: Radius.circular(28),
      ),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
            width: 56,
            height: 56,
            padding: const EdgeInsets.all(8),
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.person,
              color: AppColors.primary,
            )),
        const SizedBox(height: 14),
        Text(
          'اسم المستخدم',
          textDirection: TextDirection.rtl,
          style: AppTextStyles.headlineSmall.copyWith(
            color: AppColors.textOnPrimary,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 2),
        Text(
          'Syrian Telecom',
          style: AppTextStyles.bodySmall.copyWith(
            color: AppColors.textOnPrimary.withOpacity(0.85),
            letterSpacing: 0.5,
          ),
        ),
      ],
    ),
  );
}

Widget _buildFooter() {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 16),
    child: Column(
      children: [
        const Divider(color: AppColors.divider, height: 1),
        const SizedBox(height: 12),
        Text(
          'الإصدار 1.0.0',
          textDirection: TextDirection.rtl,
          style: AppTextStyles.bodySmall.copyWith(
            color: AppColors.textHint,
          ),
        ),
      ],
    ),
  );
}

class _DrawerItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color iconColor;
  final Color iconBackground;
  final VoidCallback onTap;

  const _DrawerItem({
    required this.icon,
    required this.label,
    required this.iconColor,
    required this.iconBackground,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(14),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 6),
          child: Row(
            textDirection: TextDirection.rtl,
            children: [
              Container(
                width: 42,
                height: 42,
                decoration: BoxDecoration(
                  color: iconBackground,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(icon, color: iconColor, size: 22),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Text(
                  label,
                  textDirection: TextDirection.rtl,
                  style: AppTextStyles.titleMedium.copyWith(
                    color: AppColors.textPrimary,
                  ),
                ),
              ),
              Icon(
                Icons.chevron_left_rounded,
                color: AppColors.gray400,
                size: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _DrawerExpansionItem extends StatefulWidget {
  final IconData icon;
  final String label;
  final Color iconColor;
  final Color iconBackground;
  final List<Widget> children;

  const _DrawerExpansionItem({
    required this.icon,
    required this.label,
    required this.iconColor,
    required this.iconBackground,
    required this.children,
  });

  @override
  State<_DrawerExpansionItem> createState() => _DrawerExpansionItemState();
}

class _DrawerExpansionItemState extends State<_DrawerExpansionItem> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(14),
            onTap: () => setState(() => _isExpanded = !_isExpanded),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 6),
              child: Row(
                textDirection: TextDirection.rtl,
                children: [
                  Container(
                    width: 42,
                    height: 42,
                    decoration: BoxDecoration(
                      color: widget.iconBackground,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Icon(widget.icon, color: widget.iconColor, size: 22),
                  ),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Text(
                      widget.label,
                      textDirection: TextDirection.rtl,
                      style: AppTextStyles.titleMedium.copyWith(
                        color: AppColors.textPrimary,
                      ),
                    ),
                  ),
                  AnimatedRotation(
                    turns: _isExpanded ? 0.5 : 0,
                    duration: const Duration(milliseconds: 250),
                    child: Icon(
                      Icons.keyboard_arrow_left,
                      color: AppColors.gray400,
                      size: 22,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        AnimatedSize(
          duration: const Duration(milliseconds: 250),
          curve: Curves.easeInOut,
          child: _isExpanded
              ? Padding(
                  padding: const EdgeInsets.only(right: 12, bottom: 4),
                  child: Column(children: widget.children),
                )
              : const SizedBox(width: double.infinity),
        ),
      ],
    );
  }
}

class _DrawerSubItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color? iconColor;
  final VoidCallback onTap;

  const _DrawerSubItem({
    required this.icon,
    required this.label,
    required this.onTap,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
          child: Row(
            textDirection: TextDirection.rtl,
            children: [
              Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  color: AppColors.gray100,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(
                  icon,
                  color: iconColor ?? AppColors.gray900,
                  size: 17,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  label,
                  textDirection: TextDirection.rtl,
                  style: AppTextStyles.bodyMedium.copyWith(
                    color: iconColor ?? AppColors.textPrimary,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
