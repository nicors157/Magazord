import 'package:sqflite/sqflite.dart';
import 'package:teste_vaga/database/tables/table_produto.dart';
import 'package:teste_vaga/models/model_produto/model_produto.dart';

import '../helpers/db_helper.dart';

class DbProdutoController {
  static Future<int> insert(ModelProduto produto) async {
    return await DBHelper.executeTransaction((txn) async {
      int pkUsuario = await DBHelper.insert(
        sql: 'INSERT INTO ${TableProduto.tableName} ('
            '${TableProduto.descricao}, '
            '${TableProduto.preco}, '
            '${TableProduto.imagem} '
            ') VALUES (?, ?, ?)',
        arguments: [
          produto.proDescricao,
          produto.proPreco,
          produto.proImagem,
        ],
        transaction: txn,
      );

      return pkUsuario;
    });
  }

  static Future<void> updateProduto(
    ModelProduto produto, {
    Transaction? transaction,
  }) async {
    await DBHelper.update(
      sql: 'UPDATE ${TableProduto.tableName} SET '
          '${TableProduto.descricao} = ?, '
          '${TableProduto.preco} = ?, '
          '${TableProduto.imagem} = ? '
          'WHERE ${TableProduto.pkProduto} = ? ',
      arguments: [
        produto.proDescricao,
        produto.proPreco,
        produto.proImagem,
        produto.proId
      ],
      transaction: transaction,
    );
  }

  static Future<List<ModelProduto>?> getAllProdutos() async {
    List<Map> response =
        await DBHelper.select(sql: 'SELECT * FROM ${TableProduto.tableName}');

    if (response.isEmpty) {
      return null;
    }

    return response.map((e) => ModelProduto.fromMap(e)).toList();
  }

  static Future<ModelProduto?> getProduto(int pkProduto) async {
    List<Map> response = await DBHelper.select(
        sql: 'SELECT * FROM ${TableProduto.tableName} '
            'WHERE ${TableProduto.pkProduto} = ? ',
        arguments: [pkProduto]);

    if (response.isEmpty) {
      return null;
    }

    return ModelProduto.fromMap(response.first);
  }

  static Future<bool> deleteProduto(int pkProduto) async {
    int response = await DBHelper.delete(
        sql: 'DELETE FROM ${TableProduto.tableName} '
            'WHERE ${TableProduto.pkProduto} = ?',
        arguments: [pkProduto]);
    return response == 1;
  }

  static Future<bool> deleteAllProdutos() async {
    int response =
        await DBHelper.delete(sql: 'DELETE FROM ${TableProduto.tableName}');
    return response == 1;
  }
}
