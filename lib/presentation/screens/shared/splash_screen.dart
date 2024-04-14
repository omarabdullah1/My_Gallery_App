import 'dart:async';
import 'package:flutter/material.dart';
import '../../../constants/screens.dart';
import '../../styles/colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Timer? timer;

  @override
  void dispose() {
    timer!.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    timer = Timer(
      const Duration(
        seconds: 1,
      ),
      () => Navigator.pushNamedAndRemoveUntil(
          context, Screens.loginScreen, (route) => false),
    );
    return const Scaffold(
      backgroundColor: AppColor.white,
      body: Center(
        // child: Image.asset(),
      ),
    );
  }
}
