import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_route.dart';
import 'package:flutter/material.dart';

class FlushBarHelper {
  static void flushBarMessage(
      {required String message,
      required BuildContext context,
      bool isError = false}) {
    showFlushbar(
        context: context,
        flushbar: Flushbar(
          duration: const Duration(seconds: 2),
          forwardAnimationCurve: Curves.decelerate,
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          padding: const EdgeInsets.all(15),
          borderRadius: BorderRadius.circular(8),
          message: message,
          reverseAnimationCurve: Curves.easeInOut,
          backgroundColor: isError ? Colors.red : Colors.green,
          positionOffset: 20,
          icon: isError ? const Icon(Icons.error) : const Icon(Icons.info),
        )..show(context));
  }
}
