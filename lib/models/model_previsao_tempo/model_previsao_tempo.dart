class ModelPrevisaoTempo {
ModelPrevisaoTempo.fromMap(dynamic data) {
  _cidade = data['name'];
  _temperaturaMinima = data['main']['temp_min'].toString();
  _temperaturaMaxima = data['main']['temp_max'].toString();
  _humidade = data['main']['humidity'].toString();
  _temperaturaAtual = data['main']['temp'].toString();
} 

late String _cidade;
late String _temperaturaMinima;
late String _temperaturaMaxima;
late String _temperaturaAtual;
late String _humidade;

String get cidade => _cidade;
String get temperaturaMinima => _temperaturaMinima;
String get temperaturaMaxima => _temperaturaMaxima;
String get temperaturaAtual => _temperaturaAtual;
String get humidade => _humidade;

}