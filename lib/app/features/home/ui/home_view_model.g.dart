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

  late final _$loadAsyncAction = AsyncAction(
    'HomeViewModelBase.load',
    context: context,
  );

  @override
  Future<void> load() {
    return _$loadAsyncAction.run(() => super.load());
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

  @override
  String toString() {
    return '''
coinMarketList: ${coinMarketList}
    ''';
  }
}
