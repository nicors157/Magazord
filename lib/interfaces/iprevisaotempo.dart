import 'package:teste_vaga/models/model_previsao_tempo/model_previsao_tempo.dart';

abstract class IPrevisaoTempo {
  Future<ModelPrevisaoTempo> getPrevisaoTempo(latitude, longitude);
}