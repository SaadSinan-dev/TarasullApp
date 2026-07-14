import 'package:flutter/material.dart';
import 'package:tarassul_new/core/theme/colors/app_colors.dart';
import 'package:tarassul_new/core/theme/styles/app_text_style.dart';
import 'package:tarassul_new/core/widgets/secondappbar/second_app_bar.dart';

class AvailablePortsScreen extends StatefulWidget {
  const AvailablePortsScreen({super.key});

  @override
  State<AvailablePortsScreen> createState() => _AvailablePortsScreenState();
}

class _AvailablePortsScreenState extends State<AvailablePortsScreen> {
  final _searchController = TextEditingController();
  String _query = '';

  final List<_Port> _allPorts = const [
    _Port(area: 'المزة', exchange: 'مقسم المزة', available: 12),
    _Port(area: 'كفرسوسة', exchange: 'مقسم كفرسوسة', available: 4),
    _Port(area: 'الميدان', exchange: 'مقسم الميدان', available: 0),
    _Port(area: 'باب توما', exchange: 'مقسم باب توما', available: 21),
  ];

  List<_Port> get _filtered => _query.isEmpty
      ? _allPorts
      : _allPorts
          .where((p) => p.area.contains(_query) || p.exchange.contains(_query))
          .toList();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: SecondaryAppBar(title: 'البوابات الشاغرة'),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              controller: _searchController,
              textDirection: TextDirection.rtl,
              onChanged: (value) => setState(() => _query = value),
              decoration: InputDecoration(
                hintText: 'ابحث عن منطقة أو مقسم',
                hintTextDirection: TextDirection.rtl,
                prefixIcon:
                    Icon(Icons.search_rounded, color: AppColors.gray500),
                filled: true,
                fillColor: AppColors.gray50,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                  borderSide: BorderSide(color: Colors.grey.withOpacity(0.2)),
                ),
              ),
            ),
          ),
          Expanded(
            child: _filtered.isEmpty
                ? Center(
                    child: Text(
                      'لا توجد نتائج',
                      textDirection: TextDirection.rtl,
                      style: AppTextStyles.bodyMedium
                          .copyWith(color: AppColors.textHint),
                    ),
                  )
                : ListView.separated(
                    padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                    itemCount: _filtered.length,
                    separatorBuilder: (_, __) => const SizedBox(height: 12),
                    itemBuilder: (context, index) =>
                        _PortCard(port: _filtered[index]),
                  ),
          ),
        ],
      ),
    );
  }
}

class _Port {
  final String area;
  final String exchange;
  final int available;

  const _Port({
    required this.area,
    required this.exchange,
    required this.available,
  });
}

class _PortCard extends StatelessWidget {
  final _Port port;

  const _PortCard({required this.port});

  bool get _isAvailable => port.available > 0;

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
              color: AppColors.secondaryContainer,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(Icons.router_rounded,
                color: AppColors.secondary, size: 22),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              textDirection: TextDirection.rtl,
              children: [
                Text(
                  port.area,
                  textDirection: TextDirection.rtl,
                  style: AppTextStyles.titleMedium
                      .copyWith(color: AppColors.textPrimary),
                ),
                const SizedBox(height: 4),
                Text(
                  port.exchange,
                  textDirection: TextDirection.rtl,
                  style: AppTextStyles.bodySmall
                      .copyWith(color: AppColors.textSecondary),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: BoxDecoration(
              color: (_isAvailable ? AppColors.success : AppColors.error)
                  .withOpacity(0.12),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              _isAvailable ? '${port.available} شاغر' : 'ممتلئ',
              textDirection: TextDirection.rtl,
              style: AppTextStyles.bodySmall.copyWith(
                color: _isAvailable ? AppColors.success : AppColors.error,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
