import 'package:easyfood_app/features/configuracoes/widgets/cache_listtile_widget.dart';
import 'package:easyfood_app/features/configuracoes/widgets/dados_stone_listtile_widget.dart';
import 'package:easyfood_app/features/configuracoes/widgets/endereco_servidor_listtile_widget.dart';
import 'package:easyfood_app/features/configuracoes/widgets/modo_offline_listtile_widget.dart';
import 'package:easyfood_app/features/configuracoes/widgets/modo_visualizacao_cardapio_listtile_widget.dart';
import 'package:flutter/material.dart';

class ConfiguracoesScreen extends StatelessWidget {
  const ConfiguracoesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Configurações'),
        ),
        body: ListView(
          children: [
            EnderecoServidorListTileWidget(),
            const ModoVisualizacaoCardapioListTileWidget(),
            const CacheListTileWidget(),
            const DadosStoneListTileWidget(),
            const ModoOfflineListTileWidget(),
          ],
        ),
      ),
    );
  }
}
