import 'package:mobx/mobx.dart';
import 'package:teste_vaga/models/model_previsao_tempo/model_previsao_tempo.dart';

part 'previsao_tempo_state.g.dart';

class PrevisaoTempoState = _PrevisaoTempoState with _$PrevisaoTempoState;

abstract class _PrevisaoTempoState with Store {
  @observable
  ModelPrevisaoTempo? _previsao;

  @observable
  bool _loading = false;

  @observable
  bool _hasError = false;

  @observable
  bool _hasInternet = true;

  @computed
  ModelPrevisaoTempo? get previsao => _previsao;

  @computed
  bool get loading => _loading;

  @computed
  bool get hasError => _hasError;

  @computed
  bool get hasInternet => _hasInternet;

  @action
  void setPrevisao({required ModelPrevisaoTempo prev}) {
    _previsao = prev;
  }

  @action
  void setLoading({required bool value}) {
    _loading = value;

    if (value) {
      _hasError = false;
    }
  }

  @action
  void setHasError({required bool value}) {
    _hasError = value;
  }

  @action
  void setHasInternet({required bool value}){
    _hasInternet = value;
  }
}
