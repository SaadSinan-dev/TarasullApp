import 'package:flutter/material.dart';

/// App Colors
/// Centralized color palette for the Telecom App
/// Following Clean Architecture - located at: core/theme/app_colors.dart
class AppColors {
  AppColors._(); // Prevent instantiation

  // ==================== Primary Colors (Blue) ====================
  static const Color primary = Color(0xFF1A56DB);
  static const Color primaryDark = Color(0xFF1140A6);
  static const Color primaryLight = Color(0xFF4C82F0);
  static const Color primaryContainer = Color(0xFFE0EAFF);

  // ==================== Secondary Colors (Orange) ====================
  static const Color secondary = Color(0xFFFF7A00);
  static const Color secondaryDark = Color(0xFFC85F00);
  static const Color secondaryLight = Color(0xFFFFA04D);
  static const Color secondaryContainer = Color(0xFFFFE8D1);

  // ==================== Neutral / Gray Scale ====================
  static const Color gray50 = Color(0xFFF9FAFB);
  static const Color gray100 = Color(0xFFF3F4F6);
  static const Color gray200 = Color(0xFFE5E7EB);
  static const Color gray300 = Color(0xFFD1D5DB);
  static const Color gray400 = Color(0xFF9CA3AF);
  static const Color gray500 = Color(0xFF6B7280);
  static const Color gray600 = Color(0xFF4B5563);
  static const Color gray700 = Color(0xFF374151);
  static const Color gray800 = Color(0xFF1F2937);
  static const Color gray900 = Color(0xFF111827);

  // ==================== Background Colors ====================
  static const Color background = Color(0xFFFFFFFF);
  static const Color backgroundDark = Color(0xFF0F1115);
  static const Color surface = Color(0xFFF9FAFB);
  static const Color surfaceDark = Color(0xFF1A1D23);

  // ==================== Text Colors ====================
  static const Color textPrimary = Color(0xFF111827);
  static const Color textSecondary = Color(0xFF6B7280);
  static const Color textHint = Color(0xFF9CA3AF);
  static const Color textOnPrimary = Color(0xFFFFFFFF);
  static const Color textOnDark = Color(0xFFF9FAFB);

  // ==================== Status Colors ====================
  static const Color success = Color(0xFF12B76A);
  static const Color warning = Color(0xFFF79009);
  static const Color error = Color(0xFFD92D20);
  static const Color info = Color(0xFF1A56DB);

  // ==================== Border & Divider ====================
  static const Color border = Color(0xFFE5E7EB);
  static const Color divider = Color(0xFFF3F4F6);

  // ==================== Gradients ====================
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [primary, secondary],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient cardGradient = LinearGradient(
    colors: [primaryLight, secondaryLight],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );

  // ==================== Overlay / Shadow ====================
  static const Color shadow = Color(0x1A000000); // 10% black
  static const Color overlay = Color(0x99000000); // 60% black
}
