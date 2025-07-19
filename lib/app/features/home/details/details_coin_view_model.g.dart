// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'details_coin_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$DetailsCoinViewModel on DetailsCoinViewModelBase, Store {
  Computed<CoinModel?>? _$coinIdComputed;

  @override
  CoinModel? get coinId => (_$coinIdComputed ??= Computed<CoinModel?>(
    () => super.coinId,
    name: 'DetailsCoinViewModelBase.coinId',
  )).value;
  Computed<CoinDetailModel?>? _$coinDetailComputed;

  @override
  CoinDetailModel? get coinDetail =>
      (_$coinDetailComputed ??= Computed<CoinDetailModel?>(
        () => super.coinDetail,
        name: 'DetailsCoinViewModelBase.coinDetail',
      )).value;
  Computed<bool>? _$isFavoriteComputed;

  @override
  bool get isFavorite => (_$isFavoriteComputed ??= Computed<bool>(
    () => super.isFavorite,
    name: 'DetailsCoinViewModelBase.isFavorite',
  )).value;
  Computed<List<double>?>? _$coinPriceHistoryComputed;

  @override
  List<double>? get coinPriceHistory =>
      (_$coinPriceHistoryComputed ??= Computed<List<double>?>(
        () => super.coinPriceHistory,
        name: 'DetailsCoinViewModelBase.coinPriceHistory',
      )).value;

  late final _$_coinIdAtom = Atom(
    name: 'DetailsCoinViewModelBase._coinId',
    context: context,
  );

  @override
  CoinModel? get _coinId {
    _$_coinIdAtom.reportRead();
    return super._coinId;
  }

  @override
  set _coinId(CoinModel? value) {
    _$_coinIdAtom.reportWrite(value, super._coinId, () {
      super._coinId = value;
    });
  }

  late final _$_coinDetailAtom = Atom(
    name: 'DetailsCoinViewModelBase._coinDetail',
    context: context,
  );

  @override
  CoinDetailModel? get _coinDetail {
    _$_coinDetailAtom.reportRead();
    return super._coinDetail;
  }

  @override
  set _coinDetail(CoinDetailModel? value) {
    _$_coinDetailAtom.reportWrite(value, super._coinDetail, () {
      super._coinDetail = value;
    });
  }

  late final _$_coinPriceHistoryAtom = Atom(
    name: 'DetailsCoinViewModelBase._coinPriceHistory',
    context: context,
  );

  @override
  List<double>? get _coinPriceHistory {
    _$_coinPriceHistoryAtom.reportRead();
    return super._coinPriceHistory;
  }

  @override
  set _coinPriceHistory(List<double>? value) {
    _$_coinPriceHistoryAtom.reportWrite(value, super._coinPriceHistory, () {
      super._coinPriceHistory = value;
    });
  }

  late final _$loadCoinDetailAsyncAction = AsyncAction(
    'DetailsCoinViewModelBase.loadCoinDetail',
    context: context,
  );

  @override
  Future<void> loadCoinDetail(CoinModel coin) {
    return _$loadCoinDetailAsyncAction.run(() => super.loadCoinDetail(coin));
  }

  late final _$loadPriceHistoryAsyncAction = AsyncAction(
    'DetailsCoinViewModelBase.loadPriceHistory',
    context: context,
  );

  @override
  Future<void> loadPriceHistory(String id) {
    return _$loadPriceHistoryAsyncAction.run(() => super.loadPriceHistory(id));
  }

  late final _$updateFavoritiesAsyncAction = AsyncAction(
    'DetailsCoinViewModelBase.updateFavorities',
    context: context,
  );

  @override
  Future<void> updateFavorities() {
    return _$updateFavoritiesAsyncAction.run(() => super.updateFavorities());
  }

  late final _$DetailsCoinViewModelBaseActionController = ActionController(
    name: 'DetailsCoinViewModelBase',
    context: context,
  );

  @override
  void load(CoinModel coin) {
    final _$actionInfo = _$DetailsCoinViewModelBaseActionController.startAction(
      name: 'DetailsCoinViewModelBase.load',
    );
    try {
      return super.load(coin);
    } finally {
      _$DetailsCoinViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
coinId: ${coinId},
coinDetail: ${coinDetail},
isFavorite: ${isFavorite},
coinPriceHistory: ${coinPriceHistory}
    ''';
  }
}
