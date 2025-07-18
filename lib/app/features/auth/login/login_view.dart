import 'dart:developer';

import 'package:app_cripto/app/core/ui/helpers/notifier/listener_view.dart';
import 'package:app_cripto/app/core/ui/messages.dart';
import 'package:app_cripto/app/core/ui/widgets/app_field.dart';
import 'package:app_cripto/app/core/ui/widgets/app_logo.dart';
import 'package:app_cripto/app/features/auth/login/login_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:validatorless/validatorless.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final FocusNode _emailFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    ListenerView(
      viewModel: context.read<LoginViewModel>(),
    ).listener(
      context: context,
      successCallback: (viewModel, listenerView) {
        log('Login efetuado com sucesso');
      },
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

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
                    SizedBox.square(dimension: 90),
                    SizedBox(
                      height: MediaQuery.sizeOf(context).width * 0.4,
                      child: FittedBox(
                        fit: BoxFit.fitHeight,
                        child: AppLogo(),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 40,
                        vertical: 20,
                      ),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            AppField(
                              label: 'E-mail',
                              focusNode: _emailFocusNode,
                              controller: _emailController,
                              validator: Validatorless.multiple([
                                Validatorless.required('E-mail obrigatório'),
                                Validatorless.email('E-mail inválido'),
                              ]),
                            ),
                            SizedBox.square(dimension: 20),
                            AppField(
                              label: 'Senha',
                              obscureText: true,
                              controller: _passwordController,
                              validator: Validatorless.multiple([
                                Validatorless.required('Senha obrigatória'),
                                Validatorless.min(
                                  6,
                                  'Senha deve ter pelo menos 6 caracteres',
                                ),
                              ]),
                            ),
                            SizedBox.square(dimension: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                TextButton(
                                  onPressed: () {
                                    if (_emailController.text.isEmpty) {
                                      _emailFocusNode.requestFocus();
                                      Messages.of(context).showError(
                                        'Por favor, informe seu e-mail',
                                      );
                                      return;
                                    }
                                    context.read<LoginViewModel>().resetPassword(
                                      _emailController.text,
                                    );
                                  },
                                  child: Text('Esqueceu sua senha?'),
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    final isValid =
                                        _formKey.currentState?.validate() ??
                                        false;
                                    if (isValid) {
                                      final email = _emailController.text;
                                      final password = _passwordController.text;
                                      context.read<LoginViewModel>().login(
                                        email,
                                        password,
                                      );
                                    }
                                  },
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
