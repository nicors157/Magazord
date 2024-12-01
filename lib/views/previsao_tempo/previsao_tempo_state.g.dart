// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'previsao_tempo_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$PrevisaoTempoState on _PrevisaoTempoState, Store {
  Computed<ModelPrevisaoTempo?>? _$previsaoComputed;

  @override
  ModelPrevisaoTempo? get previsao => (_$previsaoComputed ??=
          Computed<ModelPrevisaoTempo?>(() => super.previsao,
              name: '_PrevisaoTempoState.previsao'))
      .value;
  Computed<bool>? _$loadingComputed;

  @override
  bool get loading => (_$loadingComputed ??= Computed<bool>(() => super.loading,
          name: '_PrevisaoTempoState.loading'))
      .value;
  Computed<bool>? _$hasErrorComputed;

  @override
  bool get hasError =>
      (_$hasErrorComputed ??= Computed<bool>(() => super.hasError,
              name: '_PrevisaoTempoState.hasError'))
          .value;
  Computed<bool>? _$hasInternetComputed;

  @override
  bool get hasInternet =>
      (_$hasInternetComputed ??= Computed<bool>(() => super.hasInternet,
              name: '_PrevisaoTempoState.hasInternet'))
          .value;

  late final _$_previsaoAtom =
      Atom(name: '_PrevisaoTempoState._previsao', context: context);

  @override
  ModelPrevisaoTempo? get _previsao {
    _$_previsaoAtom.reportRead();
    return super._previsao;
  }

  @override
  set _previsao(ModelPrevisaoTempo? value) {
    _$_previsaoAtom.reportWrite(value, super._previsao, () {
      super._previsao = value;
    });
  }

  late final _$_loadingAtom =
      Atom(name: '_PrevisaoTempoState._loading', context: context);

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
      Atom(name: '_PrevisaoTempoState._hasError', context: context);

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

  late final _$_hasInternetAtom =
      Atom(name: '_PrevisaoTempoState._hasInternet', context: context);

  @override
  bool get _hasInternet {
    _$_hasInternetAtom.reportRead();
    return super._hasInternet;
  }

  @override
  set _hasInternet(bool value) {
    _$_hasInternetAtom.reportWrite(value, super._hasInternet, () {
      super._hasInternet = value;
    });
  }

  late final _$_PrevisaoTempoStateActionController =
      ActionController(name: '_PrevisaoTempoState', context: context);

  @override
  void setPrevisao({required ModelPrevisaoTempo prev}) {
    final _$actionInfo = _$_PrevisaoTempoStateActionController.startAction(
        name: '_PrevisaoTempoState.setPrevisao');
    try {
      return super.setPrevisao(prev: prev);
    } finally {
      _$_PrevisaoTempoStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setLoading({required bool value}) {
    final _$actionInfo = _$_PrevisaoTempoStateActionController.startAction(
        name: '_PrevisaoTempoState.setLoading');
    try {
      return super.setLoading(value: value);
    } finally {
      _$_PrevisaoTempoStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setHasError({required bool value}) {
    final _$actionInfo = _$_PrevisaoTempoStateActionController.startAction(
        name: '_PrevisaoTempoState.setHasError');
    try {
      return super.setHasError(value: value);
    } finally {
      _$_PrevisaoTempoStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setHasInternet({required bool value}) {
    final _$actionInfo = _$_PrevisaoTempoStateActionController.startAction(
        name: '_PrevisaoTempoState.setHasInternet');
    try {
      return super.setHasInternet(value: value);
    } finally {
      _$_PrevisaoTempoStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
previsao: ${previsao},
loading: ${loading},
hasError: ${hasError},
hasInternet: ${hasInternet}
    ''';
  }
}
