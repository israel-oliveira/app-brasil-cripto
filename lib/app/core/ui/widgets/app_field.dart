import 'package:flutter/material.dart';

class AppField extends StatelessWidget {
  AppField({
    super.key,
    required this.label,
    this.obscureText = false,
    this.suffixIconButton,
    this.controller,
    this.validator,
  }) : assert(
         obscureText ? suffixIconButton == null : true,
         'Obscure text não pode ser enviado em conjunto com suffixIconButton',
       ),
       obscureTextNotifier = ValueNotifier(obscureText);

  final String label;
  final IconButton? suffixIconButton;
  final bool obscureText;
  final ValueNotifier<bool> obscureTextNotifier;
  final TextEditingController? controller;
  final FormFieldValidator<String>? validator;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: obscureTextNotifier,
      builder: (context, obscureTextValue, child) {
        return TextFormField(
          controller: controller,
          validator: validator,
          decoration: InputDecoration(
            labelText: label,
            labelStyle: TextStyle(fontSize: 15, color: Colors.black),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide(color: Colors.red),
            ),
            isDense: true,
            suffixIcon:
                suffixIconButton ??
                (obscureText
                    ? IconButton(
                        onPressed: () =>
                            obscureTextNotifier.value = !obscureTextValue,
                        icon: Icon(
                          obscureTextValue
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                      )
                    : null),
          ),
          obscureText: obscureTextValue,
        );
      },
    );
  }
}
