import 'package:easyfood_app/features/common/domain/entities/conta_entity.dart';
import 'package:easyfood_app/features/realizar_pedido/domain/entities/check_nivel_acesso_entity.dart';
import 'package:flutter/material.dart';

class PagamentoContaState extends ChangeNotifier {
  final keyCredito = const Key('credito');
  final keyDebito = const Key('debito');
  final keyPix = const Key('pix');
  final keyDinheiro = const Key('dinheiro');
  ContaEntity conta;
  final double? _couvertOriginal;
  final double? _gorjetaOriginal;

  bool get canEditTotal {
    return true;
  }

  Key? _selected;

  PagamentoContaState(this.conta)
      : _totalAPagar = conta.totalCalculado,
        _couvertOriginal = conta.couvert,
        _gorjetaOriginal = conta.gorjeta;

  Key? get selected => _selected;

  double _totalAPagar;
  double get totalAPagar => _totalAPagar;

  set totalAPagar(double value) {
    _totalAPagar = value;
    notifyListeners();
  }

  bool get removerCouvert {
    if (_couvertOriginal == null || _couvertOriginal == 0) {
      // Não tinha couvert
      return false;
    }

    return conta.couvert == null;
  }

  void removeCouvert(CheckNivelAcessoEntity autorizacao) {
    conta.couvert = null;
    conta.usuarioRemocaoCouvert = autorizacao.idUsuario;
    _totalAPagar = conta.totalCalculado;
    notifyListeners();
  }

  bool get removerGorjeta {
    if (_gorjetaOriginal == null || _gorjetaOriginal == 0) {
      // Não tinha gorjeta
      return false;
    }

    return conta.gorjeta == null;
  }

  void removeTip(CheckNivelAcessoEntity autorizacao) {
    conta.gorjeta = null;
    conta.usuarioRemocaoGorjeta = autorizacao.idUsuario;
    _totalAPagar = conta.totalCalculado;
    notifyListeners();
  }

  set selected(Key? key) {
    _selected = key;
    notifyListeners();
  }

  bool isVisible(Key? key) {
    return true;
  }
}
