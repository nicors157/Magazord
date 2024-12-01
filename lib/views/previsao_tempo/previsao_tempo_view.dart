import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:geolocator/geolocator.dart';
import 'package:teste_vaga/configs/constants.dart';
import 'package:teste_vaga/models/erros/error_model.dart';
import 'package:teste_vaga/models/model_previsao_tempo/model_previsao_tempo.dart';
import 'package:teste_vaga/repositories/previsao_tempo_repository.dart';
import 'package:teste_vaga/services/dialog_service.dart';
import 'package:teste_vaga/services/service_locator.dart';
import 'package:teste_vaga/views/previsao_tempo/previsao_tempo_state.dart';
import 'package:teste_vaga/widgets/cs_app_bar.dart';

class PrevisaoTempoView extends StatefulWidget {
  @override
  _PrevisaoTempoViewState createState() => _PrevisaoTempoViewState();
}

class _PrevisaoTempoViewState extends State<PrevisaoTempoView> {
  final stateView = getIt<PrevisaoTempoState>();
  String? temperature;
  String? description;
  bool isLoading = true;
  String? errorMessage;

  @override
  void initState() {
    super.initState();
    _getPrevisao();
  }

  Future<void> _getPrevisao() async {
    try {
      stateView.setLoading(value: true);
      Position position = await _getLocalizacao();
      double latitude = position.latitude;
      double longitude = position.longitude;

      ModelPrevisaoTempo prev =
          await PrevisaoTempoRepository.getPrevisaoTempo(latitude, longitude);
      stateView.setPrevisao(prev: prev);
    } catch (err) {
      if (err is ErrorModel && err.type == ErrorType.internet) {
        stateView.setHasInternet(value: false);
      } else {
        stateView.setHasError(value: false);
        showSnackbar(description: 'Erro ao buscar a localização!');
      }
    } finally {
      stateView.setLoading(value: false);
    }
  }

  Future<Position> _getLocalizacao() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      throw Exception('Os serviços de localização estão desativados.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        throw Exception('Permissão de localização negada.');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      throw Exception('Permissão de localização permanentemente negada.');
    }

    return await Geolocator.getCurrentPosition();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
        appBar: const CsAppBar(
          title: 'Clima Atual',
        ),
        body: Observer(
          builder: (_) {
            if (stateView.loading) {
              return const Center(child: CircularProgressIndicator());
            }
            if (stateView.previsao != null) {
              final previsao = stateView.previsao;
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '${previsao!.cidade}`',
                      style: TextStyle(
                          fontSize: 24, color: theme.colorScheme.primary),
                    ),
                    Text(
                      'Temperatura Minima: ${previsao.temperaturaMinima}°C`',
                      style: TextStyle(
                          fontSize: 14, color: theme.colorScheme.primary),
                    ),
                    Text(
                      'Temperatura Maxima: ${previsao.temperaturaMaxima}°C',
                      style: TextStyle(
                          fontSize: 14, color: theme.colorScheme.primary),
                    ),
                    Text(
                      'Temperatura Atual: ${previsao.temperaturaMaxima}°C',
                      style: TextStyle(
                          fontSize: 14, color: theme.colorScheme.primary),
                    ),
                    Text(
                      'Humidade: ${previsao.humidade}',
                      style: TextStyle(
                          fontSize: 14, color: theme.colorScheme.primary),
                    ),
                  ],
                ),
              );
            }
            return Center(
              child: TextButton.icon(
                icon: const Icon(Icons.refresh),
                onPressed: _getPrevisao,
                label: const Text(
                  'Atualizar',
                  style: TextStyle(color: Colors.black, fontSize: 20),
                ),
              ),
            );
          },
        ));
  }
}
