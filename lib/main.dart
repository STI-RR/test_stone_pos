import 'package:easyfood_app/config/config_firebase.dart';
import 'package:easyfood_app/core/util/app_version.dart';
import 'package:easyfood_app/features/common/presentation/states/auth_state.dart';
import 'package:easyfood_app/features/configuracoes/state/configuracoes_state.dart';
import 'package:easyfood_app/features/login/presentation/pages/login_page.dart';
import 'package:easyfood_app/flutter_method_channel.dart';
import 'package:easyfood_app/my_theme.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';

void main() async {
  runApp(const LoadingApp());
  if (kReleaseMode) {
    await configureFirebase();
  }
  WidgetsFlutterBinding.ensureInitialized();
  await AppVersion.loadAppVersion();
  final GlobalKey<NavigatorState> navigator = GlobalKey<NavigatorState>();
  Animate.restartOnHotReload = true;
  runApp(MyApp(navigator));
  FlutterMethodChannel.instance.configureChannel();
}

class MyApp extends StatelessWidget {
  final GlobalKey<NavigatorState> navigator;
  const MyApp(this.navigator, {super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      /// Lista de providers que serão utilizados na aplicação
      providers: [
        /// O provider AuthState é utilizado para armazenar dados de autenticação, como por exemplo
        /// os dados do usuário logado, o nível de acesso do usuário, etc.
        ChangeNotifierProvider(create: (_) => AuthState()),

        /// O provider ConfiguracoesState é utilizado para armazenar dados de configurações
        ChangeNotifierProvider(create: (_) => ConfiguracoesState()),
      ],
      child: MaterialApp(
        title: 'Easy Food',
        theme: MyTheme.lightTheme,
        darkTheme: MyTheme.lightTheme,
        debugShowCheckedModeBanner: false,
        home: const LoginPage(),
        navigatorKey: navigator,
      ),
    );
  }
}

class LoadingApp extends StatelessWidget {
  const LoadingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Easy Food',
      theme: MyTheme.lightTheme,
      darkTheme: MyTheme.lightTheme,
      debugShowCheckedModeBanner: false,
      home: const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
