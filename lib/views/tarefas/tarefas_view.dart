import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:teste_vaga/configs/routes/local_routes.dart';
import 'package:teste_vaga/database/controllers/db_tarefa_controller.dart';
import 'package:teste_vaga/models/model_tarefa/model_tarefa.dart';
import 'package:teste_vaga/services/dialog_service.dart';
import 'package:teste_vaga/services/navigation_service.dart';
import 'package:teste_vaga/services/service_locator.dart';
import 'package:teste_vaga/views/tarefas/tarefas_state.dart';
import 'package:teste_vaga/widgets/cs_app_bar.dart';
import 'package:teste_vaga/widgets/cs_card_tarefa.dart';

class TarefasView extends StatefulWidget {
  const TarefasView({super.key});

  @override
  State<TarefasView> createState() => _TarefasViewState();
}

class _TarefasViewState extends State<TarefasView> {
  final stateView = getIt<TarefaState>();

  @override
  void initState() {
    super.initState();

    _fetchData();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _fetchData() async {
    try {
      stateView.setLoading(value: true);
      List<ModelTarefa>? listaTarefas =
          await DbTarefaController.getAllTarefas();

      stateView.setTarefas(tarefas: listaTarefas);
    } catch (_) {
      showSnackbar(description: 'Erro ao buscar os produtos');
    } finally {
      stateView.setLoading(value: false);
    }
  }

  Future<void> updateCompletedStatus(int tarId, int isChecked) async {
    await DbTarefaController.updateStatus(tarId, isChecked);
  }

  void changeCheckBox(ModelTarefa tarefa, bool? isChecked) async {
    final newStatus = isChecked! ? 1 : 0;
    await updateCompletedStatus(tarefa.tarId, newStatus);

    setState(() {
      tarefa.setCompleted(newStatus);
    });
  }

  void onDeleteTarefa(ModelTarefa tarefa) async {
    try {
      await DbTarefaController.deleteTarefa(tarefa.tarId);
      showSnackbar(description: 'Tarefa excluida com sucesso!');
    } catch (error) {
      showSnackbar(description: 'Erro ao excluir tarefa');
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: CsAppBar(
        title: 'Tarefas',
        actions: [
          TextButton.icon(
            label: const Text(
              'Limpar',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            icon: const Icon(
              Icons.delete,
              color: Colors.white,
            ),
            onPressed: () async {
              await DbTarefaController.deleteAllTarefas();
              _fetchData();
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
        child: Observer(
          builder: (_) {
            if (stateView.loading) {
              return const Center(child: CircularProgressIndicator());
            }

            if (stateView.listaTarefas.isNotEmpty) {
              return ListView.builder(
                  itemCount: stateView.listaTarefas.length,
                  itemBuilder: (context, index) {
                    var tar = stateView.listaTarefas[index];
                    return CsCardTarefa(
                      title: tar.tarTitle,
                      completed: tar.tarCompleted,
                      description: tar.tarDescription,
                      onChangeCompleted: (value) => changeCheckBox(tar, value),
                      onDelete: () => onDeleteTarefa(tar),
                    );
                  });
            } else {
              return Center(
                child: Text(
                  'Nenhuma Tarefa Cadastrada',
                  style: TextStyle(
                    color: theme.colorScheme.primary,
                    fontSize: 20,
                  ),
                ),
              );
            }
          },
        ),
      ),
      floatingActionButton: ElevatedButton(
        onPressed: () async {
          await getIt<NavigationService>()
              .pushNamed(LocalRoutes.CADASTRO_TAREFA_SCREEN);

          _fetchData();
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: theme.colorScheme.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        child: const Text(
          'Cadastro Tarefa',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
