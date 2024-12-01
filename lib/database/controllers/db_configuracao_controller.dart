import 'package:sqflite/sqflite.dart';
import 'package:teste_vaga/database/helpers/db_helper.dart';
import 'package:teste_vaga/database/tables/table_configuracao.dart';
import 'package:teste_vaga/models/model_configuracao/model_configuracao.dart';

class DbConfiguracaoController {
  static Future<int> insert(ModelConfiguracao config) async {
    return await DBHelper.executeTransaction((txn) async {
      int pkConfiguracao = await DBHelper.insert(
        sql: 'INSERT INTO ${TableConfiguracao.tableName} ('
            '${TableConfiguracao.gremioTheme} '
            ') VALUES (?)',
        arguments: [config.gremioTheme],
        transaction: txn,
      );
      return pkConfiguracao;
    });
  }

  static Future<void> updateConfiguracao(
    ModelConfiguracao config, {
    Transaction? transaction,
  }) async {
    await DBHelper.update(
        sql: 'UPDATE ${TableConfiguracao.tableName} SET '
            '${TableConfiguracao.gremioTheme} = ? '
            'WHERE ${TableConfiguracao.pkConfiguracao} = ? ',
        arguments: [
          config.gremioTheme,
          config.configId,
        ]);
  }

  static Future<ModelConfiguracao?> getConfiguracao() async {
    List<Map> response = await DBHelper.select(
      sql: 'SELECT * FROM ${TableConfiguracao.tableName}',
    );

    if (response.isEmpty) {
      ModelConfiguracao config = await createConfig();
      return config;
    }

    return ModelConfiguracao.fromMap(response.first);
  }

  static Future<ModelConfiguracao> createConfig() async {
    ModelConfiguracao config = ModelConfiguracao();
    config.setTheme(0);
    int idConfig = await insert(config);
    config.setId(idConfig);

    return config;
  }
}
