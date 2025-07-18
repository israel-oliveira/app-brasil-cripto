// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeViewModel on HomeViewModelBase, Store {
  Computed<ObservableList<CoinMarketModel>>? _$coinMarketListComputed;

  @override
  ObservableList<CoinMarketModel> get coinMarketList =>
      (_$coinMarketListComputed ??= Computed<ObservableList<CoinMarketModel>>(
        () => super.coinMarketList,
        name: 'HomeViewModelBase.coinMarketList',
      )).value;
  Computed<ObservableList<CoinModel>>? _$favoritiesCoinComputed;

  @override
  ObservableList<CoinModel> get favoritiesCoin =>
      (_$favoritiesCoinComputed ??= Computed<ObservableList<CoinModel>>(
        () => super.favoritiesCoin,
        name: 'HomeViewModelBase.favoritiesCoin',
      )).value;

  late final _$_coinMarketListAtom = Atom(
    name: 'HomeViewModelBase._coinMarketList',
    context: context,
  );

  @override
  ObservableList<CoinMarketModel> get _coinMarketList {
    _$_coinMarketListAtom.reportRead();
    return super._coinMarketList;
  }

  @override
  set _coinMarketList(ObservableList<CoinMarketModel> value) {
    _$_coinMarketListAtom.reportWrite(value, super._coinMarketList, () {
      super._coinMarketList = value;
    });
  }

  late final _$_favoritiesCoinAtom = Atom(
    name: 'HomeViewModelBase._favoritiesCoin',
    context: context,
  );

  @override
  ObservableList<CoinModel> get _favoritiesCoin {
    _$_favoritiesCoinAtom.reportRead();
    return super._favoritiesCoin;
  }

  @override
  set _favoritiesCoin(ObservableList<CoinModel> value) {
    _$_favoritiesCoinAtom.reportWrite(value, super._favoritiesCoin, () {
      super._favoritiesCoin = value;
    });
  }

  late final _$loadAsyncAction = AsyncAction(
    'HomeViewModelBase.load',
    context: context,
  );

  @override
  Future<void> load() {
    return _$loadAsyncAction.run(() => super.load());
  }

  late final _$updateFavoritiesAsyncAction = AsyncAction(
    'HomeViewModelBase.updateFavorities',
    context: context,
  );

  @override
  Future<void> updateFavorities(CoinModel coin) {
    return _$updateFavoritiesAsyncAction.run(
      () => super.updateFavorities(coin),
    );
  }

  late final _$infiniteScrollLoadAsyncAction = AsyncAction(
    'HomeViewModelBase.infiniteScrollLoad',
    context: context,
  );

  @override
  Future<void> infiniteScrollLoad() {
    return _$infiniteScrollLoadAsyncAction.run(
      () => super.infiniteScrollLoad(),
    );
  }

  late final _$_loadCoinMarketAsyncAction = AsyncAction(
    'HomeViewModelBase._loadCoinMarket',
    context: context,
  );

  @override
  Future<void> _loadCoinMarket() {
    return _$_loadCoinMarketAsyncAction.run(() => super._loadCoinMarket());
  }

  late final _$loadFavoritesCoinAsyncAction = AsyncAction(
    'HomeViewModelBase.loadFavoritesCoin',
    context: context,
  );

  @override
  Future<void> loadFavoritesCoin() {
    return _$loadFavoritesCoinAsyncAction.run(() => super.loadFavoritesCoin());
  }

  late final _$HomeViewModelBaseActionController = ActionController(
    name: 'HomeViewModelBase',
    context: context,
  );

  @override
  void _defineFavorities() {
    final _$actionInfo = _$HomeViewModelBaseActionController.startAction(
      name: 'HomeViewModelBase._defineFavorities',
    );
    try {
      return super._defineFavorities();
    } finally {
      _$HomeViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
coinMarketList: ${coinMarketList},
favoritiesCoin: ${favoritiesCoin}
    ''';
  }
}
