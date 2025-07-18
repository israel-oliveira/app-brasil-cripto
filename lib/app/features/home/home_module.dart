import 'package:app_cripto/app/core/client/dio_client.dart';
import 'package:app_cripto/app/core/database/sql_connection_factory.dart';
import 'package:app_cripto/app/core/modules/app_module.dart';
import 'package:app_cripto/app/domain/repositories/coin/coin_coingecko_repository.dart';
import 'package:app_cripto/app/domain/services/coin/coin_coingecko_service.dart';
import 'package:app_cripto/app/features/home/details/details_coin_view.dart';
import 'package:app_cripto/app/features/home/details/details_coin_view_model.dart';
import 'package:app_cripto/app/features/home/favorites/favorites_view.dart';
import 'package:app_cripto/app/features/home/favorites/favorites_view_model.dart';
import 'package:app_cripto/app/features/home/ui/home_view.dart';
import 'package:app_cripto/app/features/home/ui/home_view_model.dart';
import 'package:provider/provider.dart';

class HomeModule extends AppModule {
  HomeModule()
    : super(
        routers: {
          '/home': (_) => const HomeView(),
          '/favoritas': (_) =>
              const FavoritesView(),
          '/detalhes': (_) => const DetailsCoinView(),
        },
        bindings: [
          Provider(
            create: (context) => CoinCoingeckoService(
              client: context.read<DioClient>(),
              sqlConnectionFactory: context.read<SqlConnectionFactory>(),
            ),
          ),
          Provider(
            create: (context) => CoinCoingeckoRepository(
              coinService: context.read<CoinCoingeckoService>(),
            ),
          ),
          Provider(
            create: (context) => HomeViewModel(
              coinRepository: context.read<CoinCoingeckoRepository>(),
            ),
          ),
          Provider(
            create: (context) => FavoritesViewModel(
              coinRepository: context.read<CoinCoingeckoRepository>(),
            ),
          ),
          Provider(create: (context) => DetailsCoinViewModel(
            coinRepository: context.read<CoinCoingeckoRepository>(),
          )),
        ],
      );
}
