import 'package:flutter/material.dart';
import 'package:tarassul_new/core/routing/app_routes.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: AppRouter.generateRoute,
      initialRoute: AppRoutes.splash,
      theme: ThemeData(fontFamily: 'Tajawal'),
      debugShowCheckedModeBanner: false,
    );
  }
}
