import 'package:app_cripto/app/core/exceptions/client_exception.dart';
import 'package:app_cripto/app/core/ui/helpers/notifier/app_base_view_model.dart';
import 'package:app_cripto/app/domain/models/coin/coin_market_model.dart';
import 'package:app_cripto/app/domain/models/coin/coin_model.dart';
import 'package:app_cripto/app/domain/repositories/coin/coin_repository.dart';
import 'package:mobx/mobx.dart';
part 'home_view_model.g.dart';

class HomeViewModel = HomeViewModelBase with _$HomeViewModel;

abstract class HomeViewModelBase extends AppBaseViewModel with Store {
  final CoinRepository _coinRepository;

  HomeViewModelBase({required CoinRepository coinRepository})
    : _coinRepository = coinRepository;

  @observable
  ObservableList<CoinMarketModel> _coinMarketList =
      ObservableList<CoinMarketModel>();

  @computed
  ObservableList<CoinMarketModel> get coinMarketList => _coinMarketList;

  @observable
  ObservableList<CoinModel> _favoritiesCoin = ObservableList<CoinModel>();

  @computed
  ObservableList<CoinModel> get favoritiesCoin => _favoritiesCoin;

  List<CoinModel> _coins = [];

  List<CoinModel> get coins => _coins;

  int _page = 1;

  @action
  Future<void> load() async {
    showLoadAndResetState();
    await Future.wait([
      _loadCoinMarket(),
      _loadCoin(),
    ]);

    if (!hasError) {
      success();
    }else{
      setError(error ?? 'Não foi possível carregar os dados');
    }
  }

  @action
  Future<void> updateFavorities(CoinModel coin) async {
    coin.isFavorite = !coin.isFavorite;
    final result = await _coinRepository.saveFavorites(coin);
    result.fold(
      (success) {
        if (success) {
          if(coin.isFavorite) {
            _favoritiesCoin.add(coin);
          } else {
            _favoritiesCoin.removeWhere((c) => c.id == coin.id);
          }
          _defineFavorities();
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

  @action
  Future<void> infiniteScrollLoad() async {
    showLoadAndResetState();
    if (_coinMarketList.isNotEmpty) {
      await _loadCoinMarket();
    }
    success();
  }

  @action
  Future<void> _loadCoinMarket() async {
    final result = await _coinRepository.getCoinMarketByPage(_page);
    result.fold(
      (coinMarketList) {
        _coinMarketList.addAll(coinMarketList);
        _page++;
        loadFavoritesCoin();
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
  void _defineFavorities() {
    List<CoinMarketModel> tempValue = _coinMarketList;

    for (var coin in tempValue) {
      if (_favoritiesCoin.any((c) => c.id == coin.id)) {
        coin.isFavorite = true;
      } else {
        coin.isFavorite = false;
      }
    }
    _coinMarketList = ObservableList<CoinMarketModel>.of(tempValue);
  }

  @action
  Future<void> loadFavoritesCoin() async {
    final result = await _coinRepository.getFavorites();
    result.fold(
      (coins) {
        _favoritiesCoin.clear();
        _favoritiesCoin.addAll(coins);
        _defineFavorities();
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

  Future<void> _loadCoin() async {
    final result = await _coinRepository.getAllCoins();
    result.fold(
      (coins) {
        _coins = coins;
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
}
