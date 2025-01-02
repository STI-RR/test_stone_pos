import 'package:flutter/material.dart';

class ConfiguracoesState extends ChangeNotifier {
  String? _novoEnderecoServidor;
  String? get enderecoServidor => 'http://';
  set enderecoServidor(String? value) => _novoEnderecoServidor = value;

  String? _modoVisualizacaoCardapio;
  String get modoVisualizacaoCardapio => _modoVisualizacaoCardapio ?? 'grid';
  set modoVisualizacaoCardapio(String value) => _modoVisualizacaoCardapio = value;

  bool _modoOffline = false;
  bool get modoOffline => _modoOffline;
  set modoOffline(bool value) {
    _modoOffline = value;
    notifyListeners();
  }

  ConfiguracoesState();

  void salvarEnderecoServidor() {}

  void salvarModoVisualizacaoCardapio() {}

  void salvarModoOffline() {}
}
