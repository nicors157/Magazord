import 'package:mobx/mobx.dart';
import 'package:teste_vaga/models/model_tarefa/model_tarefa.dart';

part 'tarefas_state.g.dart';

class TarefaState = _TarefaState with _$TarefaState;

abstract class _TarefaState with Store {
  @observable
  List<ModelTarefa> _listaTarefas = ObservableList();

  @observable
  bool _loading = false;

  @observable
  bool _hasError = false;

  @computed
  List<ModelTarefa> get listaTarefas => _listaTarefas;

  @computed
  bool get loading => _loading;

  @computed
  bool get hasError => _hasError;

  @action
  void setTarefas({required List<ModelTarefa>? tarefas}) {
    _listaTarefas.clear();
    if (tarefas != null && tarefas.isNotEmpty) {
      _listaTarefas.addAll(tarefas);
    }
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
}
