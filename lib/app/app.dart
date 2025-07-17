import 'package:app_cripto/app/core/navigator/app_navigator.dart';
import 'package:app_cripto/app/core/ui/app_theme.dart';
import 'package:app_cripto/app/features/home/home_module.dart';
import 'package:app_cripto/app/features/splash/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(
          create: (_) => Object(),
          lazy: false,
        ),
      ],
      child: MaterialApp(
        title: 'Brasil Cripto',
        theme: AppTheme.theme,
        navigatorKey: AppNavigator.navigatorKey,
        routes: {...HomeModule().routers},
        home: SplashView(),
      ),
    );
  }
}
