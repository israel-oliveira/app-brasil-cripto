import 'package:app_cripto/app/core/modules/app_module.dart';
import 'package:app_cripto/app/features/auth/login/login_view.dart';
import 'package:app_cripto/app/features/auth/login/login_view_model.dart';
import 'package:app_cripto/app/features/auth/register/register_view.dart';
import 'package:app_cripto/app/features/auth/register/register_view_model.dart';
import 'package:provider/provider.dart';

class AuthModule extends AppModule {
  AuthModule()
    : super(
        routers: {
          '/login': (_) => const LoginView(),
          '/register': (_) => const RegisterView(),
        },
        bindings: [
          Provider(create: (_) => LoginViewModel()),
          Provider(create: (_) => RegisterViewModel()),
        ],
      );
}
