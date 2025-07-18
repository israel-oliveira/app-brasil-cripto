import 'package:app_cripto/app/core/exceptions/client_exception.dart';
import 'package:app_cripto/app/core/ui/helpers/notifier/app_base_view_model.dart';
import 'package:app_cripto/app/domain/models/coin/coin_market_model.dart';
import 'package:app_cripto/app/domain/models/coin/coin_model.dart';
import 'package:app_cripto/app/domain/repositories/coin/coin_repository.dart';
import 'package:mobx/mobx.dart';
part 'favorites_view_model.g.dart';

class FavoritesViewModel = FavoritesViewModelBase with _$FavoritesViewModel;

abstract class FavoritesViewModelBase extends AppBaseViewModel with Store {
  final CoinRepository _coinRepository;
  FavoritesViewModelBase({required CoinRepository coinRepository})
    : _coinRepository = coinRepository;

  @observable
  ObservableList<CoinMarketModel> _coinMarketFavoritesList =
      ObservableList<CoinMarketModel>();

  @computed
  ObservableList<CoinMarketModel> get coinMarketFavoritesList =>
      _coinMarketFavoritesList;

  @action
  Future<void> load() async {
    showLoadAndResetState();
    _loadFavoritiesCoinMarket();

  }

  @action
  Future<void> _loadCoinMarket(List<CoinModel> favorities) async {
    final result = await _coinRepository.getFavoritiesCoinMarket(favorities);
    result.fold(
      (coinMarketList) {
        _coinMarketFavoritesList.addAll(coinMarketList);
        success();
      },
      (error) {
        if (error is ClientException) {
          setError(error.message);
        } else {
          setError('Não foi possivel carregar os dados');
        }
      },
    );
  }

  @action
  Future<void> _loadFavoritiesCoinMarket() async {
    final result = await _coinRepository.getFavorites();
    result.fold(
      (coins) {
        _loadCoinMarket(coins);
      },
      (error) {
        if (error is ClientException) {
          setError(error.message);
        } else {
          setError('Não foi possivel carregar os dados');
        }
      },
    );
  }

  @action
  Future<void> updateFavorities(CoinModel coin) async {
    coin.isFavorite = !coin.isFavorite;
    final result = await _coinRepository.saveFavorites(coin);
    result.fold(
      (success) {
        if (success) {
          if (!coin.isFavorite) {
            _coinMarketFavoritesList.removeWhere((c) => c.id == coin.id);
          }
        }
      },
      (error) {
        if (error is ClientException) {
          setError(error.message);
        } else {
          setError('Não foi possivel atualizar os dados');
        }
      },
    );
  }
}
