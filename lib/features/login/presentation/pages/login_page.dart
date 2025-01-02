import 'package:easyfood_app/features/configuracoes/screens/configuracoes_screen.dart';
import 'package:easyfood_app/features/login/presentation/pages/login_controller.dart';
import 'package:easyfood_app/features/login/presentation/states/login_state.dart';
import 'package:easyfood_app/features/login/presentation/widgets/login_form.dart';
import 'package:easyfood_app/loading_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(
          create: (_) => LoginController(),
        ),
      ],
      builder: (context, _) => SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: const Text('EasyFood App'),
            actions: [
              IconButton(
                icon: const Icon(Icons.settings),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const ConfiguracoesScreen()));
                },
              ),
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: MultiProvider(
              providers: [
                ChangeNotifierProvider<LoginState>(create: (_) => context.read<LoginController>().state),
              ],
              builder: (context, _) => const _BodyWidget(),
            ),
          ),
        ),
      ),
    );
  }
}

class _BodyWidget extends StatelessWidget {
  const _BodyWidget();

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        final state = context.watch<LoginState>();
        switch (state.loadingState) {
          case LoadingState.loading:
            return const Center(child: CircularProgressIndicator());
          case LoadingState.loaded:
            return const LoginForm();
          case LoadingState.error:
            return const LoginForm();
        }
      },
    );
  }
}
