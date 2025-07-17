import 'package:flutter/material.dart';

class AppLogo  extends StatelessWidget {
  const AppLogo ({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          'assets/logo.png',
          height: 200,
        ),
      ],
    );
  }
}
