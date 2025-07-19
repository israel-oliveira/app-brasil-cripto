// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'details_coin_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$DetailsCoinViewModel on DetailsCoinViewModelBase, Store {
  Computed<String?>? _$coinIdComputed;

  @override
  String? get coinId => (_$coinIdComputed ??= Computed<String?>(
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

  late final _$_coinIdAtom = Atom(
    name: 'DetailsCoinViewModelBase._coinId',
    context: context,
  );

  @override
  String? get _coinId {
    _$_coinIdAtom.reportRead();
    return super._coinId;
  }

  @override
  set _coinId(String? value) {
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

  late final _$loadCoinDetailAsyncAction = AsyncAction(
    'DetailsCoinViewModelBase.loadCoinDetail',
    context: context,
  );

  @override
  Future<void> loadCoinDetail(String id) {
    return _$loadCoinDetailAsyncAction.run(() => super.loadCoinDetail(id));
  }

  @override
  String toString() {
    return '''
coinId: ${coinId},
coinDetail: ${coinDetail}
    ''';
  }
}
