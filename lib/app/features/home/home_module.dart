
import 'package:app_cripto/app/core/modules/app_module.dart';
import 'package:app_cripto/app/features/home/favorites/favorites_view.dart';
import 'package:app_cripto/app/features/home/favorites/favorites_view_model.dart';
import 'package:app_cripto/app/features/home/ui/home_view.dart';
import 'package:app_cripto/app/features/home/ui/home_view_model.dart';
import 'package:provider/provider.dart';

class HomeModule extends AppModule{
  HomeModule()
      : super(
          routers: {
            '/home': (_) => const HomeView(),
            '/favoritas': (_) => const FavoritesView(), // Assuming favorites view is also part of home
          },
          bindings: [
            Provider(create: (_) => HomeViewModel()),
            Provider(create: (_) => FavoritesViewModel()),
          ],
        );
}