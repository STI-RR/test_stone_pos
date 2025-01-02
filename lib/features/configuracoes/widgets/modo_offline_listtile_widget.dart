import 'package:easyfood_app/features/configuracoes/state/configuracoes_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ModoOfflineListTileWidget extends StatelessWidget {
  const ModoOfflineListTileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final ativo = context.watch<ConfiguracoesState>().modoOffline;
    return ListTile(
      title: Text('Modo Offline ${ativo ? '(ativado)' : '(desativado)'}'),
      subtitle: const Text('Use o app sem conexão com o EasyFood e venda fichas.'),
      onTap: () => _onTap(context),
    );
  }

  void _onTap(BuildContext context) {
    context.read<ConfiguracoesState>().salvarModoOffline();
  }
}
