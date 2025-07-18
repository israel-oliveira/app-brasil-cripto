// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorites_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$FavoritesViewModel on FavoritesViewModelBase, Store {
  Computed<ObservableList<CoinMarketModel>>? _$coinMarketFavoritesListComputed;

  @override
  ObservableList<CoinMarketModel> get coinMarketFavoritesList =>
      (_$coinMarketFavoritesListComputed ??=
              Computed<ObservableList<CoinMarketModel>>(
                () => super.coinMarketFavoritesList,
                name: 'FavoritesViewModelBase.coinMarketFavoritesList',
              ))
          .value;

  late final _$_coinMarketFavoritesListAtom = Atom(
    name: 'FavoritesViewModelBase._coinMarketFavoritesList',
    context: context,
  );

  @override
  ObservableList<CoinMarketModel> get _coinMarketFavoritesList {
    _$_coinMarketFavoritesListAtom.reportRead();
    return super._coinMarketFavoritesList;
  }

  @override
  set _coinMarketFavoritesList(ObservableList<CoinMarketModel> value) {
    _$_coinMarketFavoritesListAtom.reportWrite(
      value,
      super._coinMarketFavoritesList,
      () {
        super._coinMarketFavoritesList = value;
      },
    );
  }

  late final _$loadAsyncAction = AsyncAction(
    'FavoritesViewModelBase.load',
    context: context,
  );

  @override
  Future<void> load() {
    return _$loadAsyncAction.run(() => super.load());
  }

  late final _$_loadCoinMarketAsyncAction = AsyncAction(
    'FavoritesViewModelBase._loadCoinMarket',
    context: context,
  );

  @override
  Future<void> _loadCoinMarket(List<CoinModel> favorities) {
    return _$_loadCoinMarketAsyncAction.run(
      () => super._loadCoinMarket(favorities),
    );
  }

  late final _$_loadFavoritiesCoinMarketAsyncAction = AsyncAction(
    'FavoritesViewModelBase._loadFavoritiesCoinMarket',
    context: context,
  );

  @override
  Future<void> _loadFavoritiesCoinMarket() {
    return _$_loadFavoritiesCoinMarketAsyncAction.run(
      () => super._loadFavoritiesCoinMarket(),
    );
  }

  late final _$updateFavoritiesAsyncAction = AsyncAction(
    'FavoritesViewModelBase.updateFavorities',
    context: context,
  );

  @override
  Future<void> updateFavorities(CoinModel coin) {
    return _$updateFavoritiesAsyncAction.run(
      () => super.updateFavorities(coin),
    );
  }

  @override
  String toString() {
    return '''
coinMarketFavoritesList: ${coinMarketFavoritesList}
    ''';
  }
}
