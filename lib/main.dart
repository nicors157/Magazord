import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:teste_vaga/configs/theme/theme_app.dart';
import 'package:teste_vaga/models/model_configuracao/model_configuracao.dart';
import 'package:teste_vaga/services/navigation_service.dart';
import 'package:teste_vaga/widgets/no_glow_effect.dart';

import 'configs/constants.dart';
import 'configs/routes/local_routes.dart';
import 'router_app.dart';
import 'services/service_locator.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  setupServiceLocator();

  SystemChrome.setPreferredOrientations(
    const [
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ],
  );

  runApp(const TesteVaga());
}

class TesteVaga extends StatelessWidget {
  const TesteVaga({super.key});

  @override
  Widget build(BuildContext context) {
    final config = getIt<ModelConfiguracao>();
    return Observer(
      builder: (_) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: App.NAME,
          theme: config.gremioTheme == 1
              ? ThemeApp.gremioTheme
              : ThemeApp.ligthTheme,
          themeMode: ThemeMode.light,
          navigatorKey: getIt<NavigationService>().navigatorKey,
          builder: (context, child) {
            if (!getIt.isRegistered<BuildContext>()) {
              getIt.registerSingleton<BuildContext>(context);
            }
        
            return ScrollConfiguration(
              behavior: const NoGlowEffect(),
              child: child!,
            );
          },
          localizationsDelegates: GlobalMaterialLocalizations.delegates,
          supportedLocales: const [Locale('pt', 'BR')],
          initialRoute: LocalRoutes.SPLASH_SCREEN,
          onGenerateRoute: RouterApp.onGenerateRoute,
        );
      }
    );
  }
}
