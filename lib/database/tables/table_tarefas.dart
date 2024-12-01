class TableTarefas {
  static const tableName = 'tarefas';

  ///[INTEGER] - PK
  static const pkTarefa = 'tar_id';

  ///[TEXT]
  static const nome = 'tar_title';

  ///[TEXT]
  static const descricao = 'tar_description';

  ///[INTEGER]
  static const completa = 'tar_completed';
}