import 'package:sqflite/sqflite.dart';
import 'package:teste_vaga/database/helpers/db_helper.dart';
import 'package:teste_vaga/database/tables/table_tarefas.dart';
import 'package:teste_vaga/models/model_tarefa/model_tarefa.dart';

class DbTarefaController {
  static Future<int> insert(ModelTarefa tarefa) async {
    return await DBHelper.executeTransaction((txn) async {
      int pkUsuario = await DBHelper.insert(
        sql: 'INSERT INTO ${TableTarefas.tableName} ('
            '${TableTarefas.nome}, '
            '${TableTarefas.descricao}, '
            '${TableTarefas.completa} '
            ') VALUES (?, ?, ?)',
        arguments: [
          tarefa.tarTitle,
          tarefa.tarDescription,
          tarefa.tarCompleted,
        ],
        transaction: txn,
      );

      return pkUsuario;
    });
  }

  static Future<void> updateTarefa(
    ModelTarefa tarefa, {
    Transaction? transaction,
  }) async {
    await DBHelper.update(
      sql: 'UPDATE ${TableTarefas.tableName} SET '
          '${TableTarefas.descricao} = ?, '
          '${TableTarefas.completa} = ? '
          'WHERE ${TableTarefas.pkTarefa} = ? ',
      arguments: [
        tarefa.tarDescription,
        tarefa.tarCompleted,
        tarefa.tarId,
      ],
      transaction: transaction,
    );
  }

  static Future<void> updateStatus(
    int tarId, int completa, {
    Transaction? transaction,
  }) async {
    await DBHelper.update(
      sql: 'UPDATE ${TableTarefas.tableName} SET '
          '${TableTarefas.completa} = ? '
          'WHERE ${TableTarefas.pkTarefa} = ? ',
      arguments: [
        completa,
        tarId,
      ],
      transaction: transaction,
    );
  }


  static Future<List<ModelTarefa>?> getAllTarefas() async {
    List<Map> response =
        await DBHelper.select(sql: 'SELECT * FROM ${TableTarefas.tableName}');

    if (response.isEmpty) {
      return null;
    }

    return response.map((e) => ModelTarefa.fromMap(e)).toList();
  }

  static Future<ModelTarefa?> getTarefa(int pkTarefa) async {
    List<Map> response = await DBHelper.select(
        sql: 'SELECT * FROM ${TableTarefas.tableName} '
            'WHERE ${TableTarefas.pkTarefa} = ? ',
        arguments: [pkTarefa]);

    if (response.isEmpty) {
      return null;
    }

    return ModelTarefa.fromMap(response.first);
  }

  static Future<bool> deleteTarefa(int pkTarefa) async {
    int response = await DBHelper.delete(
      sql: 'DELETE FROM ${TableTarefas.tableName} '
      'WHERE ${TableTarefas.pkTarefa} = ?',
      arguments: [pkTarefa]
      );
    return response == 1;
  }

  static Future<bool> deleteAllTarefas() async {
    int response =
        await DBHelper.delete(sql: 'DELETE FROM ${TableTarefas.tableName}');
    return response == 1;
  }
}
