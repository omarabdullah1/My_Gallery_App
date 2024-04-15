import 'dart:async';
import 'package:flutter/material.dart';
import 'package:my_gallery_app/data/local/cache_helper.dart';
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
    String? token = CacheHelper.sharedPreferences.getString('token');
    timer = Timer(
      const Duration(
        seconds: 1,
      ),
      () {
        if(token!=null) {
          Navigator.pushNamedAndRemoveUntil(
              context, Screens.homeScreen, (route) => false);
        }else{
          Navigator.pushNamedAndRemoveUntil(
              context, Screens.loginScreen, (route) => false);
        }
      },
    );
    return const Scaffold(
      backgroundColor: AppColor.white,
      body: Center(
        // child: Image.asset(),
      ),
    );
  }
}
