import 'package:flutter/material.dart';
import 'package:tarassul_new/core/theme/colors/app_colors.dart';
import 'package:tarassul_new/core/theme/styles/app_text_style.dart';
import 'package:tarassul_new/core/widgets/secondappbar/second_app_bar.dart';

/// Buy Extra Data Screen
/// Lets the subscriber pick an extra-data package and confirm purchase.
class BuyExtraDataScreen extends StatefulWidget {
  const BuyExtraDataScreen({super.key});

  @override
  State<BuyExtraDataScreen> createState() => _BuyExtraDataScreenState();
}

class _BuyExtraDataScreenState extends State<BuyExtraDataScreen> {
  int _selectedIndex = 0;

  // TODO: Replace with real packages from your repository/Bloc.
  final List<_DataPackage> _packages = const [
    _DataPackage(sizeGb: 1, price: 5000),
    _DataPackage(sizeGb: 3, price: 12000),
    _DataPackage(sizeGb: 5, price: 18000),
    _DataPackage(sizeGb: 10, price: 32000),
  ];

  @override
  Widget build(BuildContext context) {
    final selected = _packages[_selectedIndex];

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: SecondaryAppBar(title: 'شراء حجوم إضافيه'),
      body: Column(
        children: [
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.all(16),
              itemCount: _packages.length,
              separatorBuilder: (_, __) => const SizedBox(height: 12),
              itemBuilder: (context, index) {
                final package = _packages[index];
                final isSelected = index == _selectedIndex;
                return _PackageOption(
                  package: package,
                  isSelected: isSelected,
                  onTap: () => setState(() => _selectedIndex = index),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: SizedBox(
              height: 52,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                  elevation: 0,
                ),
                child: Text(
                  'شراء ${selected.sizeGb} GB مقابل ${selected.price} ل.س',
                  textDirection: TextDirection.rtl,
                  style: AppTextStyles.labelLarge,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _DataPackage {
  final int sizeGb;
  final int price;

  const _DataPackage({required this.sizeGb, required this.price});
}

class _PackageOption extends StatelessWidget {
  final _DataPackage package;
  final bool isSelected;
  final VoidCallback onTap;

  const _PackageOption({
    required this.package,
    required this.isSelected,
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
            border: Border.all(
              color: isSelected ? AppColors.primary : AppColors.border,
              width: isSelected ? 1.6 : 1,
            ),
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
                child: Icon(Icons.sd_storage_rounded,
                    color: AppColors.primary, size: 22),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  textDirection: TextDirection.rtl,
                  children: [
                    Text(
                      '${package.sizeGb} GB',
                      textDirection: TextDirection.rtl,
                      style: AppTextStyles.titleLarge
                          .copyWith(color: AppColors.textPrimary),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      '${package.price} ل.س',
                      style: AppTextStyles.bodySmall
                          .copyWith(color: AppColors.textSecondary),
                    ),
                  ],
                ),
              ),
              Icon(
                isSelected
                    ? Icons.check_circle_rounded
                    : Icons.radio_button_unchecked_rounded,
                color: isSelected ? AppColors.primary : AppColors.gray300,
                size: 24,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
