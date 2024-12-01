import 'package:teste_vaga/interfaces/iprevisaotempo.dart';
import 'package:teste_vaga/models/model_previsao_tempo/model_previsao_tempo.dart';
import 'package:teste_vaga/repositories/previsao_tempo_repository.dart';

class PrevisaoTempoController implements IPrevisaoTempo {
  @override
  Future<ModelPrevisaoTempo> getPrevisaoTempo(latitude, longitude) async {
    return await PrevisaoTempoRepository.getPrevisaoTempo(latitude, longitude);
  }
}