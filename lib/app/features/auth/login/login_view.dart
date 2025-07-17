import 'package:app_cripto/app/core/ui/widgets/app_field.dart';
import 'package:app_cripto/app/core/ui/widgets/app_logo.dart';
import 'package:flutter/material.dart';
import 'package:sign_in_button/sign_in_button.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: constraints.maxHeight,
                minWidth: constraints.maxWidth,
              ),
              child: IntrinsicHeight(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox.square(dimension: 10),
                    AppLogo(),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 40,
                        vertical: 20,
                      ),
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
                            SizedBox.square(dimension: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                TextButton(
                                  onPressed: () {},
                                  child: Text('Esqueceu sua senha?'),
                                ),
                                ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Text('Login'),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox.square(dimension: 20),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color(0xfff0f3f7),
                          border: Border(
                            top: BorderSide(
                              width: 2,
                              color: Colors.grey.withAlpha(50),
                            ),
                          ),
                        ),
                        child: Column(
                          children: [
                            SizedBox.square(dimension: 30),
                            SignInButton(
                              Buttons.google,
                              text: 'Continue com o Google',
                              padding: EdgeInsets.all(5),
                              shape: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide.none,
                              ),
                              onPressed: () {},
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('Não tem conta?'),
                                TextButton(
                                  onPressed: () => Navigator.of(
                                    context,
                                  ).pushNamed('/register'),
                                  child: Text('Cadastre-se'),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
