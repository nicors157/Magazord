import 'package:flutter/material.dart';
import 'package:teste_vaga/configs/routes/local_routes.dart';
import 'package:teste_vaga/database/controllers/db_configuracao_controller.dart';
import 'package:teste_vaga/models/model_configuracao/model_configuracao.dart';
import 'package:teste_vaga/services/navigation_service.dart';
import 'package:teste_vaga/services/service_locator.dart';
import 'package:teste_vaga/widgets/cs_app_bar.dart';

class HomeScreenView extends StatefulWidget {
  const HomeScreenView({super.key});

  @override
  _HomeScreenViewState createState() => _HomeScreenViewState();
}

class _HomeScreenViewState extends State<HomeScreenView> {
  final configState = getIt<ModelConfiguracao>();
  bool themeGremio = false;

  @override
  void initState() {
    super.initState();

    themeGremio = configState.gremioTheme == 0 ? false : true;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: const CsAppBar(title: 'Teste Vaga'),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 50,
              width: size.width * 0.8,
              child: ElevatedButton(
                onPressed: () {
                  getIt<NavigationService>()
                      .pushNamed(LocalRoutes.PRODUTOS_SCREEN);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: theme.colorScheme.primary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                child: const Text(
                  'Produtos',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 50,
              width: size.width * 0.8,
              child: ElevatedButton(
                onPressed: () {
                  getIt<NavigationService>()
                      .pushNamed(LocalRoutes.TAREFAS_SCREEN);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: theme.colorScheme.primary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                child: const Text(
                  'Tarefas',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 50,
              width: size.width * 0.8,
              child: ElevatedButton(
                onPressed: () {
                  getIt<NavigationService>()
                      .pushNamed(LocalRoutes.PREVISAO_TEMPO_SCREEN);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: theme.colorScheme.primary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                child: const Text(
                  'Previsão do Tempo',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              height: 80,
              width: size.width * 0.8,
              color: theme.colorScheme.primary,
              child: Column(
                children: [
                  const Text(
                    'Outro Theme',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                  Switch(
                      activeColor: theme.colorScheme.secondary,
                      value: themeGremio,
                      onChanged: (value) async {
                        setState(() {
                          themeGremio = value;
                        });
                        configState.setTheme(value ? 1 : 0);
                        await DbConfiguracaoController.updateConfiguracao(configState);
                      }),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
