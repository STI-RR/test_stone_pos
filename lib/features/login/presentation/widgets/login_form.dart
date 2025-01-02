import 'package:easyfood_app/features/configuracoes/state/configuracoes_state.dart';
import 'package:easyfood_app/features/login/presentation/pages/login_controller.dart';
import 'package:easyfood_app/features/login/presentation/widgets/container_alerta_modo_offline.dart';
import 'package:easyfood_app/features/login/presentation/widgets/error_message.dart';
import 'package:easyfood_app/features/login/presentation/widgets/login_button.dart';
import 'package:easyfood_app/features/login/presentation/widgets/senha_text_form_field.dart';
import 'package:easyfood_app/features/login/presentation/widgets/version_info_.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final isModoOffline = context.watch<ConfiguracoesState>().modoOffline;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 600),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Form(
                key: context.read<LoginController>().formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text('Login', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                    if (!isModoOffline) const SenhaTextFormField(),
                    if (isModoOffline) const ContainerAlertaModoOffline(),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: ErrorMessage(),
                    ),
                    const LoginButton(),
                    const VersionInfo(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
