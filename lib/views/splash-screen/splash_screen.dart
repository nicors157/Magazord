import 'package:flutter/material.dart';
import 'package:teste_vaga/configs/routes/local_routes.dart';
import 'package:teste_vaga/database/controllers/db_configuracao_controller.dart';
import 'package:teste_vaga/models/model_configuracao/model_configuracao.dart';
import 'package:teste_vaga/services/navigation_service.dart';
import 'package:teste_vaga/services/service_locator.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    _prepareApp();
  }

  void _prepareApp() async {
    final configInicial = getIt<ModelConfiguracao>();
    ModelConfiguracao? config = await DbConfiguracaoController.getConfiguracao();

    configInicial.setId(config!.configId);
    configInicial.setTheme(config.gremioTheme);

    Future.delayed(const Duration(seconds: 2), () {
      getIt<NavigationService>().pushNamedAndRemoveUntil(LocalRoutes.HOME_SCREEN);
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
