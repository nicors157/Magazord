// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'produtos_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ProdutosState on _ProdutosState, Store {
  Computed<List<ModelProduto>>? _$listaProdutosComputed;

  @override
  List<ModelProduto> get listaProdutos => (_$listaProdutosComputed ??=
          Computed<List<ModelProduto>>(() => super.listaProdutos,
              name: '_ProdutosState.listaProdutos'))
      .value;
  Computed<bool>? _$loadingComputed;

  @override
  bool get loading => (_$loadingComputed ??=
          Computed<bool>(() => super.loading, name: '_ProdutosState.loading'))
      .value;
  Computed<bool>? _$hasErrorComputed;

  @override
  bool get hasError => (_$hasErrorComputed ??=
          Computed<bool>(() => super.hasError, name: '_ProdutosState.hasError'))
      .value;

  late final _$_listaProdutosAtom =
      Atom(name: '_ProdutosState._listaProdutos', context: context);

  @override
  List<ModelProduto> get _listaProdutos {
    _$_listaProdutosAtom.reportRead();
    return super._listaProdutos;
  }

  @override
  set _listaProdutos(List<ModelProduto> value) {
    _$_listaProdutosAtom.reportWrite(value, super._listaProdutos, () {
      super._listaProdutos = value;
    });
  }

  late final _$_loadingAtom =
      Atom(name: '_ProdutosState._loading', context: context);

  @override
  bool get _loading {
    _$_loadingAtom.reportRead();
    return super._loading;
  }

  @override
  set _loading(bool value) {
    _$_loadingAtom.reportWrite(value, super._loading, () {
      super._loading = value;
    });
  }

  late final _$_hasErrorAtom =
      Atom(name: '_ProdutosState._hasError', context: context);

  @override
  bool get _hasError {
    _$_hasErrorAtom.reportRead();
    return super._hasError;
  }

  @override
  set _hasError(bool value) {
    _$_hasErrorAtom.reportWrite(value, super._hasError, () {
      super._hasError = value;
    });
  }

  late final _$_ProdutosStateActionController =
      ActionController(name: '_ProdutosState', context: context);

  @override
  void setProdutos({required List<ModelProduto>? produtos}) {
    final _$actionInfo = _$_ProdutosStateActionController.startAction(
        name: '_ProdutosState.setProdutos');
    try {
      return super.setProdutos(produtos: produtos);
    } finally {
      _$_ProdutosStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setLoading({required bool value}) {
    final _$actionInfo = _$_ProdutosStateActionController.startAction(
        name: '_ProdutosState.setLoading');
    try {
      return super.setLoading(value: value);
    } finally {
      _$_ProdutosStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setHasError({required bool value}) {
    final _$actionInfo = _$_ProdutosStateActionController.startAction(
        name: '_ProdutosState.setHasError');
    try {
      return super.setHasError(value: value);
    } finally {
      _$_ProdutosStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
listaProdutos: ${listaProdutos},
loading: ${loading},
hasError: ${hasError}
    ''';
  }
}
