import 'package:flutter/material.dart';
import 'package:teste_vaga/configs/routes/local_routes.dart';
import 'package:teste_vaga/models/model_produto/model_produto.dart';
import 'package:teste_vaga/views/home/home_screen_view.dart';
import 'package:teste_vaga/views/previsao_tempo/previsao_tempo_view.dart';
import 'package:teste_vaga/views/produtos/cadastro/cadastro_produto_view.dart';
import 'package:teste_vaga/views/produtos/produtos_view.dart';
import 'package:teste_vaga/views/splash-screen/splash_screen.dart';
import 'package:teste_vaga/views/tarefas/cadastro/cadastro_tarefa_view.dart';
import 'package:teste_vaga/views/tarefas/tarefas_view.dart';

class RouterApp {
  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case LocalRoutes.SPLASH_SCREEN:
        return _PageBuilder(
          child: const SplashScreen(),
          settings: settings,
        );
      case LocalRoutes.HOME_SCREEN:
        return _PageBuilder(
          child: const HomeScreenView(),
          settings: settings,
        );
      case LocalRoutes.PREVISAO_TEMPO_SCREEN:
        return _PageBuilder(
          child: PrevisaoTempoView(),
          settings: settings,
        );
      case LocalRoutes.PRODUTOS_SCREEN:
        return _PageBuilder(
          child: const ProdutosView(),
          settings: settings,
        );
      case LocalRoutes.CADASTRO_PRODUTO_SCREEN:
        final produto = settings.arguments != null
            ? settings.arguments as ModelProduto
            : null;
        return _PageBuilder(
          child: CadastroProdutosView(
            produto: produto,
          ),
          settings: settings,
        );
      case LocalRoutes.TAREFAS_SCREEN:
        return _PageBuilder(
          child: const TarefasView(),
          settings: settings,
        );
      case LocalRoutes.CADASTRO_TAREFA_SCREEN:
        return _PageBuilder(
          child: const CadastroTarefaView(),
          settings: settings,
        );
      default:
        return _PageBuilder(
          child: Container(),
          settings: settings,
        );
    }
  }
}

class _PageBuilder extends PageRouteBuilder {
  _PageBuilder({
    required this.child,
    required this.settings,
  }) : super(
          settings: settings,
          transitionDuration: const Duration(milliseconds: 500),
          reverseTransitionDuration: const Duration(milliseconds: 100),
          transitionsBuilder: (context, animation, secAnimation, child) {
            return GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              child: child,
            );
          },
          pageBuilder: (context, animation, secAnimation) => child,
        );

  final Widget child;

  @override
  final RouteSettings settings;
}
