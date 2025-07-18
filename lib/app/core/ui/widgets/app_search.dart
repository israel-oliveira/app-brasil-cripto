import 'package:app_cripto/app/core/ui/extensions/theme_extension.dart';
import 'package:flutter/material.dart';

class AppSearch extends StatelessWidget {
  const AppSearch({
    super.key,
    this.suffixIconButton,
    this.controller,
  });

  final IconButton? suffixIconButton;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelStyle: TextStyle(fontSize: 15, color: Colors.black),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: Colors.red),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: context.primaryColor, width: 2),
          ),
          isDense: true,
          suffixIcon:
              suffixIconButton ??
              IconButton(
                icon: Icon(
                  Icons.search,
                  size: 30,
                ),
                onPressed: () {
                  // Handle search action
                },
              ),
        ),
      ),
    );
  }
}
