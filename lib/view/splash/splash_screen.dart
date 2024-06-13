import 'package:bloc_clean/config/components/loading_widget.dart';
import 'package:bloc_clean/config/components/round_button.dart';
import 'package:bloc_clean/services/splash_services/splash_services.dart';
import 'package:flutter/material.dart';

import '../../config/components/internet_exception_widget.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SplashServices _splashServices = SplashServices();
  @override
  void initState() {
    _splashServices.isLogin(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('splash screen'),
      ),
    );
  }
}
