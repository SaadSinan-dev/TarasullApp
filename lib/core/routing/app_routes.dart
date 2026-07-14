import 'package:flutter/material.dart';
import 'package:tarassul_new/feature/auth/presentation/screens/forgotpassword/forgot_password_screen.dart';
import 'package:tarassul_new/feature/auth/presentation/screens/login/login_screen.dart';
import 'package:tarassul_new/feature/home/presentation/screens/home_screen.dart';
import 'package:tarassul_new/feature/home/presentation/screens/main-service/about_screen.dart';
import 'package:tarassul_new/feature/home/presentation/screens/main-service/available_ports_screen.dart';
import 'package:tarassul_new/feature/home/presentation/screens/main-service/bill_inquiry_screen.dart';
import 'package:tarassul_new/feature/home/presentation/screens/main-service/contact_us_screen.dart';
import 'package:tarassul_new/feature/home/presentation/screens/self-service/buy_extra_data_screen.dart';
import 'package:tarassul_new/feature/home/presentation/screens/self-service/change_password_screen.dart';
import 'package:tarassul_new/feature/home/presentation/screens/self-service/usage_history_screen.dart';
import 'package:tarassul_new/feature/splash/presentation/screens/splash_screen.dart';

class AppRoutes {
  AppRoutes._();
  static const String splash = '/splash';
  static const String login = '/login';
  static const String home = '/home';
  static const String forgotpassword = '/forgotpassword';

  static const String billInquiry = '/bill-inquiry';
  static const String availablePorts = '/available-ports';
  static const String contactUs = '/contact-us';
  static const String about = '/about';
  static const String usageHistory = '/self-service/usage-history';
  static const String buyExtraData = '/self-service/buy-extra-data';
  static const String changePassword = '/self-service/change-password';
  static const String notFound = '/not-found';
}

class AppRouter {
  AppRouter._();

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.splash:
        return _buildRoute(settings, SplashScreen());

      case AppRoutes.login:
        return _buildRoute(settings, LoginScreen());
      case AppRoutes.forgotpassword:
        return _buildRoute(settings, ForgotPasswordScreen());
      case AppRoutes.home:
        return _buildRoute(settings, HomeScreen());

      case AppRoutes.billInquiry:
        return _buildRoute(
          settings,
          BillinquiryScreen(),
        );

      case AppRoutes.availablePorts:
        return _buildRoute(
          settings,
          AvailablePortsScreen(),
        );

      case AppRoutes.contactUs:
        return _buildRoute(
          settings,
          ContactUsScreen(),
        );

      case AppRoutes.about:
        return _buildRoute(
          settings,
          AboutScreen(),
        );

      case AppRoutes.usageHistory:
        return _buildRoute(
          settings,
          UsageHistoryScreen(),
        );

      case AppRoutes.buyExtraData:
        return _buildRoute(settings, BuyExtraDataScreen());

      case AppRoutes.changePassword:
        return _buildRoute(
          settings,
          ChangePasswordScreen(),
        );

      default:
        return _buildRoute(
          settings,
          _NotFoundScreen(routeName: settings.name),
        );
    }
  }

  static Route<dynamic> _buildRoute(RouteSettings settings, Widget screen) {
    return MaterialPageRoute(
      settings: settings,
      builder: (_) => screen,
    );
  }
}

class _PlaceholderScreen extends StatelessWidget {
  final String title;

  const _PlaceholderScreen({required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(
        child: Text(
          '$title\n(شاشة قيد الإنشاء)',
          textAlign: TextAlign.center,
          textDirection: TextDirection.rtl,
        ),
      ),
    );
  }
}

class _NotFoundScreen extends StatelessWidget {
  final String? routeName;

  const _NotFoundScreen({this.routeName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('صفحة غير موجودة')),
      body: Center(
        child: Text(
          'لا يوجد مسار مطابق لـ: ${routeName ?? "غير معروف"}',
          textAlign: TextAlign.center,
          textDirection: TextDirection.rtl,
        ),
      ),
    );
  }
}
