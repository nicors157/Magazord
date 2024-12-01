// ignore_for_file: unused_element

import 'package:mobx/mobx.dart';

part 'model_configuracao.g.dart';

class ModelConfiguracao = _ModelConfiguracao with _$ModelConfiguracao;

abstract class _ModelConfiguracao with Store {
  _ModelConfiguracao();

  _ModelConfiguracao.fromMap(dynamic data) {
    _configId = data['cfg_id'];
    _gremioTheme = data['cfg_gremio_theme'];
  }
  
  late int _configId;

  int get configId => _configId;

  @observable
  int _gremioTheme = 0;

  @action
  void setTheme(int value) {
    _gremioTheme = value;
  }

  @action
  void setId(int id){
    _configId = id;
  }

  @computed
  int get gremioTheme => _gremioTheme;

}
