// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model_configuracao.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ModelConfiguracao on _ModelConfiguracao, Store {
  Computed<int>? _$gremioThemeComputed;

  @override
  int get gremioTheme =>
      (_$gremioThemeComputed ??= Computed<int>(() => super.gremioTheme,
              name: '_ModelConfiguracao.gremioTheme'))
          .value;

  late final _$_gremioThemeAtom =
      Atom(name: '_ModelConfiguracao._gremioTheme', context: context);

  @override
  int get _gremioTheme {
    _$_gremioThemeAtom.reportRead();
    return super._gremioTheme;
  }

  @override
  set _gremioTheme(int value) {
    _$_gremioThemeAtom.reportWrite(value, super._gremioTheme, () {
      super._gremioTheme = value;
    });
  }

  late final _$_ModelConfiguracaoActionController =
      ActionController(name: '_ModelConfiguracao', context: context);

  @override
  void setTheme(int value) {
    final _$actionInfo = _$_ModelConfiguracaoActionController.startAction(
        name: '_ModelConfiguracao.setTheme');
    try {
      return super.setTheme(value);
    } finally {
      _$_ModelConfiguracaoActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setId(int id) {
    final _$actionInfo = _$_ModelConfiguracaoActionController.startAction(
        name: '_ModelConfiguracao.setId');
    try {
      return super.setId(id);
    } finally {
      _$_ModelConfiguracaoActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
gremioTheme: ${gremioTheme}
    ''';
  }
}
