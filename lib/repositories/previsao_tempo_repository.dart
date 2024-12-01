import 'package:teste_vaga/models/model_previsao_tempo/model_previsao_tempo.dart';
import 'package:teste_vaga/services/http_service.dart';

class PrevisaoTempoRepository {
  static Future<ModelPrevisaoTempo> getPrevisaoTempo(
      latitude, longitude) async {
    String apiKey = "2dd1e9f2ce2870d5a68ec8b9ed3b8206";
    Map params = {
      'lat': latitude,
      'lon': longitude,
      'units': 'metric',
      'appid': apiKey,
    };

    Map response = await HttpService.get(params: params);

    return ModelPrevisaoTempo.fromMap(response);
  }
}
