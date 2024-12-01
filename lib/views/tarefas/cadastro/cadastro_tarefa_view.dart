import 'package:flutter/material.dart';
import 'package:teste_vaga/widgets/cs_app_bar.dart';

import '../../../database/controllers/db_tarefa_controller.dart';
import '../../../models/model_tarefa/model_tarefa.dart';
import '../../../services/dialog_service.dart';

class CadastroTarefaView extends StatefulWidget {
  const CadastroTarefaView({super.key});

  @override
  State<CadastroTarefaView> createState() => _CadastroTarefaViewState();
}

class _CadastroTarefaViewState extends State<CadastroTarefaView> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  Future<void> _cadastrarTarefa() async {
    ModelTarefa tarefa = ModelTarefa.constructor(
        titleController.text, descriptionController.text, 0);
    try {
      await DbTarefaController.insert(tarefa);
      showSnackbar(description: 'Tarefa Cadastrada com Sucesso');
      titleController.text = '';
      descriptionController.text = '';
    } catch (error) {
      showSnackbar(description: 'Erro ao cadastar a tarefa');
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: const CsAppBar(title: 'Cadastro Tarefa'),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: titleController,
                style: TextStyle(
                  color: theme.colorScheme.primary,
                ),
                decoration: const InputDecoration(
                  labelText: 'Titulo Tarefa',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                controller: descriptionController,
                style: TextStyle(
                  color: theme.colorScheme.primary,
                ),
                decoration: const InputDecoration(
                  labelText: 'Descrição Tarefa',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 50,
                width: size.width * 0.8,
                child: ElevatedButton(
                  onPressed: () {
                    _cadastrarTarefa();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: theme.colorScheme.primary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  child: const Text(
                    'Salvar Tarefa',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
