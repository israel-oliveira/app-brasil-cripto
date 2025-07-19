import 'package:app_cripto/app/core/exceptions/client_exception.dart';
import 'package:app_cripto/app/core/ui/helpers/notifier/app_base_view_model.dart';
import 'package:app_cripto/app/domain/models/coin/coin_detail_model.dart';
import 'package:app_cripto/app/domain/models/coin/coin_model.dart';
import 'package:app_cripto/app/domain/repositories/coin/coin_repository.dart';
import 'package:mobx/mobx.dart';
part 'details_coin_view_model.g.dart';

class DetailsCoinViewModel = DetailsCoinViewModelBase
    with _$DetailsCoinViewModel;

abstract class DetailsCoinViewModelBase extends AppBaseViewModel with Store {
  final CoinRepository _coinRepository;
  DetailsCoinViewModelBase({required CoinRepository coinRepository})
    : _coinRepository = coinRepository;

  @observable
  CoinModel? _coinId;

  @computed
  CoinModel? get coinId => _coinId;

  @observable
  CoinDetailModel? _coinDetail;

  @computed
  CoinDetailModel? get coinDetail => _coinDetail;

  @computed
  bool get isFavorite => _coinDetail?.isFavorite ?? false;

  @observable
  List<double>? _coinPriceHistory;

  @computed
  List<double>? get coinPriceHistory => _coinPriceHistory;

  @action
  void load(CoinModel coin) {
    showLoadAndResetState();
    var futures = [
      loadCoinDetail(coin),
      loadPriceHistory(coin.id),
    ];
    _coinId = coin;
    Future.wait(futures)
        .then((_) {
          success();
        })
        .catchError((error) {
          setError(error.toString());
        });
  }

  @action
  Future<void> loadCoinDetail(CoinModel coin) async {
    final result = await _coinRepository.getCoinDetailById(coin.id);
    result.fold(
      (coinDetail) {
        coinDetail.isFavorite = coin.isFavorite;
        _coinDetail = coinDetail;
      },
      (error) {
        setError(error.toString());
      },
    );
  }

  @action
  Future<void> loadPriceHistory(String id) async {
    final priceHistoryResult = await _coinRepository.getCoinPriceHistoryById(
      id,
    );
    priceHistoryResult.fold(
      (priceHistory) {
        _coinPriceHistory = priceHistory;
      },
      (error) {
        setError(error.toString());
      },
    );
  }

  @action
  Future<void> updateFavorities() async {
    _coinDetail?.isFavorite = !(_coinDetail?.isFavorite ?? false);
    final result = await _coinRepository.saveFavorites(
      CoinModel(
        id: _coinDetail!.id,
        name: _coinDetail!.name,
        symbol: _coinDetail!.symbol,
        isFavorite: _coinDetail!.isFavorite,
      ),
    );
    result.fold(
      (success) {
        if (success) {
          if (_coinDetail != null) {
            CoinDetailModel value = _coinDetail!;
            _coinDetail = null;
            _coinDetail = value;
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
