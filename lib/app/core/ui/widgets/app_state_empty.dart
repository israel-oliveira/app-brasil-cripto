import 'package:app_cripto/app/core/ui/widgets/app_logo.dart';
import 'package:flutter/material.dart';

class AppStateEmpty extends StatelessWidget {
  const AppStateEmpty({super.key, this.child});

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AppLogo(),
        SizedBox.square(dimension: 20),
        Text(
          'Nenhum moeda encontrada',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.grey,
          ),
        ),
        child ?? SizedBox.square(dimension: 20),
      ],
    );
  }
}
