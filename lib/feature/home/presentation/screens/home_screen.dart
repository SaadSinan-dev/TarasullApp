import 'package:flutter/material.dart';
import 'package:tarassul_new/feature/home/presentation/widgets/appbar/custom_app_bar.dart';
import 'package:tarassul_new/feature/home/presentation/widgets/appbody/app_body.dart';
import 'package:tarassul_new/feature/home/presentation/widgets/sidebar/side_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: SideBar(),
      appBar: CustomAppBar(),
      body: AppBody(),
    );
  }
}
