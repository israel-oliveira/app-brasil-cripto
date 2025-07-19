import 'package:app_cripto/app/core/ui/helpers/notifier/app_base_view_model.dart';
import 'package:app_cripto/app/domain/models/coin/coin_detail_model.dart';
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
  String? _coinId;

  @computed
  String? get coinId => _coinId;

  @observable
  CoinDetailModel? _coinDetail;

  @computed
  CoinDetailModel? get coinDetail => _coinDetail;

  @observable
  List<double>? _coinPriceHistory;

  @computed
  List<double>? get coinPriceHistory => _coinPriceHistory;

  @action
  void load(String id) {
    showLoadAndResetState();
    var futures = [
      loadCoinDetail(id),
      loadPriceHistory(id),
    ];
    _coinId = id;
    Future.wait(futures).then((_) {
      success();
    }).catchError((error) {
      setError(error.toString());
    });
  }

  @action
  Future<void> loadCoinDetail(String id) async {
    final result = await _coinRepository.getCoinDetailById(id);
    result.fold(
      (coinDetail) {
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
}
