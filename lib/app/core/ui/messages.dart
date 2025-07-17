import 'package:app_cripto/app/core/ui/extensions/theme_extension.dart';
import 'package:flutter/material.dart';

class Messages {
  Messages._(this.context);

  final BuildContext context;

  factory Messages.of(BuildContext context) {
    return Messages._(context);
  }

  void showError(String message) => _showMessage(message, Colors.red);

  void showInfo(String message) => _showMessage(message, context.primaryColor);

  void _showMessage(String message, Color color) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: color,
      ),
    );
  }
}
