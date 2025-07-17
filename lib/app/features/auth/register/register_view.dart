import 'package:app_cripto/app/core/enum/app_state_enum.dart';
import 'package:app_cripto/app/core/ui/extensions/theme_extension.dart';
import 'package:app_cripto/app/core/ui/widgets/app_field.dart';
import 'package:app_cripto/app/core/ui/widgets/app_logo.dart';
import 'package:app_cripto/app/features/auth/register/register_view_model.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';
import 'package:validatorless/validatorless.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  late ReactionDisposer _disposer;
  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _disposer();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    _disposer = reaction<AppState>(
      (_) => context.read<RegisterViewModel>().state,
      (state) {
        final controller = context.read<RegisterViewModel>();
        final error = controller.error;
        if (state.isSuccess) {
          Navigator.of(context).pop();
        } else if (error != null && error.isNotEmpty) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(error),
              backgroundColor: Colors.red,
            ),
          );
        }
      },
    );
  }

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
              'Brasil Cripto',
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
          SizedBox(
            height: MediaQuery.sizeOf(context).width * 0.5,
            child: FittedBox(
              fit: BoxFit.fitHeight,
              child: AppLogo(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  AppField(
                    label: 'E-mail',
                    controller: _emailController,
                    validator: Validatorless.multiple([
                      Validatorless.required('E-mail obrigatório'),
                      Validatorless.email('E-mail inválido'),
                    ]),
                  ),
                  SizedBox.square(dimension: 20),
                  AppField(
                    label: 'Senha',
                    controller: _passwordController,
                    obscureText: true,
                    validator: Validatorless.multiple([
                      Validatorless.required('Senha obrigatória'),
                      Validatorless.min(
                        6,
                        'Senha deve ter pelo menos 6 caracteres',
                      ),
                    ]),
                  ),
                  SizedBox.square(dimension: 20),
                  AppField(
                    label: 'Confirmação de Senha',
                    controller: _confirmPasswordController,
                    obscureText: true,
                    validator: Validatorless.multiple([
                      Validatorless.required(
                        'Confirmação de senha é obrigatória',
                      ),
                      Validatorless.compare(
                        _passwordController,
                        'As senhas não coincidem',
                      ),
                    ]),
                  ),
                  SizedBox.square(dimension: 10),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: ElevatedButton(
                      onPressed: () {
                        final formValid =
                            _formKey.currentState?.validate() ?? false;
                        if (formValid) {
                          context.read<RegisterViewModel>().registerUser(
                            _emailController.text,
                            _passwordController.text,
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
