import 'package:flutter/material.dart';

class InternetExceptionWidget extends StatelessWidget {
  final VoidCallback onPress;
  const InternetExceptionWidget({super.key, required this.onPress});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.15,
        ),
        const Icon(
          Icons.cloud_off_rounded,
          color: Colors.red,
          size: 50,
        ),
        const Padding(
          padding: EdgeInsets.only(top: 30),
          child: Center(
            child: Text(
              "We're unable to show result. \n Please Check Your data\nConnection",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
        ElevatedButton(
          onPressed: onPress,
          child: Text('Retry'),
        )
      ],
    );
  }
}
