class ModelTarefa {
  ModelTarefa.fromMap(dynamic data) {
    _tarId = data['tar_id'];
    _tarTitle = data['tar_title'];
    _tarDescription = data['tar_description'];
    _tarCompleted = data['tar_completed'];
  }

  late int _tarId;
  late String _tarTitle;
  late String? _tarDescription;
  late int _tarCompleted;

  int get tarId => _tarId;
  String get tarTitle => _tarTitle;
  String? get tarDescription => _tarDescription;
  int get tarCompleted => _tarCompleted;

  void setId(int id) {
    _tarId = id;
  }

  void setTitle(String title) {
    _tarTitle = title;
  }

  void setDescription(String? description) {
    _tarDescription = description;
  }

  void setCompleted(int completed) {
    _tarCompleted = completed;
  }

  ModelTarefa.constructor(title, description, completed) {
    _tarTitle = title;
    _tarDescription = description;
    _tarCompleted = completed;
  }
}
