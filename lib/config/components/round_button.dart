import 'package:bloc_clean/config/color/colors.dart';
import 'package:flutter/material.dart';

class RoundButton extends StatelessWidget {
  final String title;
  final VoidCallback onPress;
  final double height;
  const RoundButton(
      {super.key,
      required this.title,
      this.height = 40,
      required this.onPress});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        height: height,
        decoration: const BoxDecoration(
          color: AppColor.buttonColor,
        ),
        child: Center(
          child: Text(title),
        ),
      ),
    );
  }
}
