// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tarefas_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TarefaState on _TarefaState, Store {
  Computed<List<ModelTarefa>>? _$listaTarefasComputed;

  @override
  List<ModelTarefa> get listaTarefas => (_$listaTarefasComputed ??=
          Computed<List<ModelTarefa>>(() => super.listaTarefas,
              name: '_TarefaState.listaTarefas'))
      .value;
  Computed<bool>? _$loadingComputed;

  @override
  bool get loading => (_$loadingComputed ??=
          Computed<bool>(() => super.loading, name: '_TarefaState.loading'))
      .value;
  Computed<bool>? _$hasErrorComputed;

  @override
  bool get hasError => (_$hasErrorComputed ??=
          Computed<bool>(() => super.hasError, name: '_TarefaState.hasError'))
      .value;

  late final _$_listaTarefasAtom =
      Atom(name: '_TarefaState._listaTarefas', context: context);

  @override
  List<ModelTarefa> get _listaTarefas {
    _$_listaTarefasAtom.reportRead();
    return super._listaTarefas;
  }

  @override
  set _listaTarefas(List<ModelTarefa> value) {
    _$_listaTarefasAtom.reportWrite(value, super._listaTarefas, () {
      super._listaTarefas = value;
    });
  }

  late final _$_loadingAtom =
      Atom(name: '_TarefaState._loading', context: context);

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
      Atom(name: '_TarefaState._hasError', context: context);

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

  late final _$_TarefaStateActionController =
      ActionController(name: '_TarefaState', context: context);

  @override
  void setTarefas({required List<ModelTarefa>? tarefas}) {
    final _$actionInfo = _$_TarefaStateActionController.startAction(
        name: '_TarefaState.setTarefas');
    try {
      return super.setTarefas(tarefas: tarefas);
    } finally {
      _$_TarefaStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setLoading({required bool value}) {
    final _$actionInfo = _$_TarefaStateActionController.startAction(
        name: '_TarefaState.setLoading');
    try {
      return super.setLoading(value: value);
    } finally {
      _$_TarefaStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setHasError({required bool value}) {
    final _$actionInfo = _$_TarefaStateActionController.startAction(
        name: '_TarefaState.setHasError');
    try {
      return super.setHasError(value: value);
    } finally {
      _$_TarefaStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
listaTarefas: ${listaTarefas},
loading: ${loading},
hasError: ${hasError}
    ''';
  }
}
