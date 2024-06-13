import 'dart:async';
import 'dart:developer';

import 'package:bloc_clean/config/routes/route_name.dart';
import 'package:bloc_clean/services/session_manager/session_controller.dart';
import 'package:flutter/material.dart';

class SplashServices {
  void isLogin(BuildContext context) {
    SessionController().getUserFromPreferences().then(
      (value) {
        if (SessionController().isLogin ?? false) {
          Timer(
            const Duration(seconds: 2),
            () => Navigator.of(context).pushNamedAndRemoveUntil(
                RouteName.homeScreen, (route) => false),
          );
        } else {
          Timer(
            const Duration(seconds: 2),
            () => Navigator.of(context).pushNamedAndRemoveUntil(
                RouteName.loginScreen, (route) => false),
          );
        }
      },
    ).onError(
      (error, stackTrace) {
        log(error.toString());
        log(stackTrace.toString());
        Timer(
          const Duration(seconds: 2),
          () => Navigator.of(context)
              .pushNamedAndRemoveUntil(RouteName.loginScreen, (route) => false),
        );
      },
    );
  }
}
