import 'package:get_it/get_it.dart';
import 'package:teste_vaga/models/model_configuracao/model_configuracao.dart';
import 'package:teste_vaga/services/navigation_service.dart';
import 'package:teste_vaga/views/previsao_tempo/previsao_tempo_state.dart';
import 'package:teste_vaga/views/produtos/produtos_state.dart';
import 'package:teste_vaga/views/tarefas/tarefas_state.dart';

final getIt = GetIt.instance;

///Registra todas as [Stores] utilizadas pelo app
setupServiceLocator({bool firstTime = true}) {
  _registerSingleton<NavigationService>(
    instance: NavigationService(),
    allowAgain: false,
    firstTime: firstTime,
  );
  _registerSingleton<ModelConfiguracao>(
    instance: ModelConfiguracao(),
    allowAgain: false,
    firstTime: firstTime,
  );

  _registerSingleton<ProdutosState>(
    instance: ProdutosState(),
    allowAgain: false,
    firstTime: firstTime,
  );
  _registerSingleton<TarefaState>(
    instance: TarefaState(),
    allowAgain: false,
    firstTime: firstTime,
  );
  _registerSingleton<PrevisaoTempoState>(
    instance: PrevisaoTempoState(),
    allowAgain: false,
    firstTime: firstTime,
  );
}

void _registerSingleton<T extends Object>({
  required T instance,
  required bool allowAgain,
  required bool firstTime,
}) {
  if (!allowAgain) {
    if (!firstTime) {
      return;
    }
  }

  getIt.registerSingleton<T>(instance);
}
