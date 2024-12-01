import 'package:teste_vaga/database/tables/table_configuracao.dart';
import 'package:teste_vaga/database/tables/table_produto.dart';
import 'package:teste_vaga/database/tables/table_tarefas.dart';

class DBCreateTables {
  static const tarefas = 'CREATE TABLE ${TableTarefas.tableName} ('
      '${TableTarefas.pkTarefa} INTEGER PRIMARY KEY,'
      '${TableTarefas.nome} TEXT NOT NULL,'
      '${TableTarefas.descricao} TEXT,'
      '${TableTarefas.completa} INTEGER '
      ');';

  static const produto = 'CREATE TABLE ${TableProduto.tableName} ('
      '${TableProduto.pkProduto} INTEGER PRIMARY KEY,'
      '${TableProduto.descricao} TEXT,'
      '${TableProduto.preco} REAL,'
      '${TableProduto.imagem} TEXT'
      ');';

  static const configuracao = 'CREATE TABLE ${TableConfiguracao.tableName} ('
      '${TableConfiguracao.pkConfiguracao} INTEGER PRIMARY KEY,'
      '${TableConfiguracao.gremioTheme} INTEGER'
      ');';
}
