import 'package:app_cripto/app/core/ui/extensions/theme_extension.dart';
import 'package:app_cripto/app/core/ui/widgets/app_field.dart';
import 'package:app_cripto/app/core/ui/widgets/app_logo.dart';
import 'package:flutter/material.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: ClipOval(
            child: Container(
              color: context.primaryColor.withAlpha(20),
              padding: EdgeInsets.all(8),
              child: Icon(
                Icons.arrow_back_ios_outlined,
                size: 20,
                color: context.primaryColor,
              ),
            ),
          ),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Todo List',
              style: TextStyle(fontSize: 12, color: context.primaryColor),
            ),
            Text(
              'Cadastro',
              style: TextStyle(fontSize: 15, color: context.primaryColor),
            ),
          ],
        ),
      ),
      body: ListView(
        children: [
          Container(
            height: MediaQuery.sizeOf(context).width * 0.5,
            child: FittedBox(
              fit: BoxFit.fitHeight,
              child: AppLogo(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
            child: Form(
              child: Column(
                children: [
                  AppField(
                    label: 'E-mail',
                  ),
                  SizedBox.square(dimension: 20),
                  AppField(
                    label: 'Senha',
                    obscureText: true,
                  ),
                  SizedBox.square(dimension: 20),
                  AppField(
                    label: 'Confirmação de Senha',
                    obscureText: true,
                  ),
                  SizedBox.square(dimension: 10),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text('Salvar'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
