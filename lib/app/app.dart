import 'package:app_cripto/app/core/client/dio_client.dart';
import 'package:app_cripto/app/core/database/sql_connection_factory.dart';
import 'package:app_cripto/app/core/navigator/app_navigator.dart';
import 'package:app_cripto/app/core/ui/app_theme.dart';
import 'package:app_cripto/app/domain/repositories/user/user_repository.dart';
import 'package:app_cripto/app/domain/repositories/user/user_repository_imp.dart';
import 'package:app_cripto/app/domain/services/user/user_service.dart';
import 'package:app_cripto/app/domain/services/user/user_service_imp.dart';
import 'package:app_cripto/app/features/auth/auth_module.dart';
import 'package:app_cripto/app/features/home/home_module.dart';
import 'package:app_cripto/app/features/splash/splash_view.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:app_cripto/app/core/auth/app_auth_provider.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (_) => FirebaseAuth.instance),
        Provider(create: (_) => SqlConnectionFactory()),
        Provider<UserService>(
          create: (context) =>
              UserServiceImp(firebaseAuth: context.read<FirebaseAuth>()),
          lazy: false,
        ),
        Provider<UserRepository>(
          create: (context) =>
              UserRepositoryImp(userService: context.read<UserService>()),
        ),
        ChangeNotifierProvider(
          create: (context) => AppAuthProvider(
            firebaseAuth: context.read<FirebaseAuth>(),
            userRepository: context.read<UserRepository>(),
          )..loadListener(),
          lazy: false,
        ),
        Provider(create: (_) => DioClient(dio: Dio())),
      ],
      child: MaterialApp(
        title: 'Brasil Cripto',
        theme: AppTheme.theme,
        navigatorKey: AppNavigator.navigatorKey,
        routes: {
          ...HomeModule().routers,
          ...AuthModule().routers,
        },
        home: SplashView(),
      ),
    );
  }
}
