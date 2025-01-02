import 'package:easyfood_app/features/configuracoes/state/configuracoes_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ModoVisualizacaoCardapioListTileWidget extends StatelessWidget {
  const ModoVisualizacaoCardapioListTileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: const Text('Modo de visualização do cardápio'),
      subtitle: Text(context.watch<ConfiguracoesState>().modoVisualizacaoCardapio),
      onTap: () => showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Modo de visualização do cardápio'),
          content: const _Content(),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancelar'),
            ),
            TextButton(
              onPressed: () {
                context.read<ConfiguracoesState>().salvarModoVisualizacaoCardapio();
                Navigator.pop(context);
              },
              child: const Text('Salvar'),
            ),
          ],
        ),
      ),
    );
  }
}

class _Content extends StatefulWidget {
  const _Content();

  @override
  State<_Content> createState() => _ContentState();
}

class _ContentState extends State<_Content> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CheckboxListTile(
          tristate: false,
          value: context.watch<ConfiguracoesState>().modoVisualizacaoCardapio == 'grid',
          onChanged: (value) => setState(() {
            context.read<ConfiguracoesState>().modoVisualizacaoCardapio = value! ? 'grid' : 'list';
          }),
          title: const Text('Em grid'),
          secondary: const Icon(Icons.grid_view),
        ),
        CheckboxListTile(
          tristate: false,
          value: context.watch<ConfiguracoesState>().modoVisualizacaoCardapio == 'list',
          onChanged: (value) => setState(() {
            context.read<ConfiguracoesState>().modoVisualizacaoCardapio = value! ? 'list' : 'grid';
          }),
          title: const Text('Em lista'),
          secondary: const Icon(Icons.list),
        ),
      ],
    );
  }
}
