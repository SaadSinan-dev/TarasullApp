// lib/features/auth/presentation/pages/login_screen.dart

import 'package:flutter/material.dart';
import 'package:tarassul_new/core/routing/app_routes.dart';
import 'package:tarassul_new/core/theme/colors/app_colors.dart';
import 'package:tarassul_new/core/theme/styles/app_text_style.dart';
import 'package:tarassul_new/feature/auth/presentation/helpers/validators/auth_validators.dart';
import 'package:tarassul_new/feature/auth/presentation/widgets/button/button.dart';
import 'package:tarassul_new/feature/auth/presentation/widgets/textfield/text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _numberController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscurePassword = true;
  bool _isLoading = false;

  @override
  void dispose() {
    _numberController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _handleLogin() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isLoading = true);

    // TODO: Replace with a real auth call
    await Future.delayed(const Duration(seconds: 1));

    if (!mounted) return;
    setState(() => _isLoading = false);
    Navigator.pushReplacementNamed(context, AppRoutes.home);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 24),
                // Logo
                Center(
                  child: Container(
                    width: 120,
                    height: 120,
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
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 80),

                Text(
                  'تسجيل الدخول',
                  textDirection: TextDirection.rtl,
                  style: AppTextStyles.headlineLarge
                      .copyWith(color: AppColors.textPrimary, fontSize: 32),
                ),
                const SizedBox(height: 6),
                Text(
                  'أدخل رقم اشتراكك وكلمة المرور للمتابعة',
                  textDirection: TextDirection.rtl,
                  style: AppTextStyles.bodyMedium.copyWith(
                    color: AppColors.textSecondary,
                  ),
                ),
                const SizedBox(height: 32),

                // Number Text Field
                LoginTextField(
                  controller: _numberController,
                  label: 'رقم المشترك',
                  prefixIcon: Icons.phone_android_rounded,
                  keyboardType: TextInputType.phone,
                  textDirection: TextDirection.ltr,
                  validator: LoginValidators.validateNumber,
                ),
                const SizedBox(height: 16),

                LoginTextField(
                  controller: _passwordController,
                  label: 'كلمة المرور',
                  prefixIcon: Icons.lock_outline_rounded,
                  obscureText: _obscurePassword,
                  validator: LoginValidators.validatePassword,
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscurePassword
                          ? Icons.visibility_off_rounded
                          : Icons.visibility_rounded,
                      color: AppColors.gray400,
                    ),
                    onPressed: () => setState(
                      () => _obscurePassword = !_obscurePassword,
                    ),
                  ),
                ),
                const SizedBox(height: 12),

                Align(
                  alignment: Alignment.centerLeft,
                  child: TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, AppRoutes.forgotpassword);
                    },
                    child: Text(
                      'نسيت كلمة المرور؟',
                      textDirection: TextDirection.rtl,
                      style: AppTextStyles.linkText,
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                LoginButton(
                  isLoading: _isLoading,
                  onPressed: _handleLogin,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
