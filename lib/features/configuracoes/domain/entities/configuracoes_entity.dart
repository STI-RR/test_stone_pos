import 'package:easyfood_app/features/configuracoes/domain/entities/configuracao_entity.dart';
import 'package:easyfood_app/flavor_setup.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ConfiguracoesEntity {
  String? enderecoServidor;
  String modoVisualizacaoCardapio = 'grid';
  bool modoOffline = false;
  bool showButtonPagarConta = false;
  static ConfiguracaoEntity? configuracaoRemota;
  Flavor? flavor;
  int tipoSistema = 10; // 10 = Garçom, 11 = Stone

  /// Mostrar ficha baseada no flavor
  bool _showFicha = false;

  /// Mostrar ficha baseada no flavor e na configuração remota
  bool get showFicha => _showFicha && configuracaoRemota?.configuracaoPos.habilitarPedidoFichaPos == true;
  set showFicha(bool value) => _showFicha = value;

  Future reload() async {
    WidgetsFlutterBinding.ensureInitialized();
    await SharedPreferences.getInstance().then((value) {
      enderecoServidor = value.getString('enderecoServidor');
      modoVisualizacaoCardapio = value.getString('modoVisualizacaoCardapio') ?? 'grid';
      modoOffline = value.getBool('modoOffline') ?? false;
    });
  }

  Future saveCurrent() async {
    await SharedPreferences.getInstance().then((value) {
      value.setString('enderecoServidor', enderecoServidor ?? '');
      value.setString('modoVisualizacaoCardapio', modoVisualizacaoCardapio);
      value.setBool('modoOffline', modoOffline);
    });
  }
}
