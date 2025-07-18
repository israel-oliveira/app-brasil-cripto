import 'package:app_cripto/app/core/exceptions/client_exception.dart';
import 'package:app_cripto/app/core/ui/helpers/notifier/app_base_view_model.dart';
import 'package:app_cripto/app/domain/models/coin/coin_market_model.dart';
import 'package:app_cripto/app/domain/repositories/coin/coin_repository.dart';
import 'package:mobx/mobx.dart';
part 'home_view_model.g.dart';

class HomeViewModel = HomeViewModelBase with _$HomeViewModel;

abstract class HomeViewModelBase extends AppBaseViewModel with Store {
  final CoinRepository _coinRepository;

  HomeViewModelBase({required CoinRepository coinRepository})
    : _coinRepository = coinRepository;

  @observable
  List<CoinMarketModel> _coinMarketList = [];

  @computed
  List<CoinMarketModel> get coinMarketList => _coinMarketList;

  @action
  Future<void> load() async {
    showLoadAndResetState();
    final result = await _coinRepository.getCoinMarketByPage(1);
    result.fold(
      (coinMarketList) {
        _coinMarketList = coinMarketList;
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
}
