import 'package:easyfood_app/features/transacoes/domain/entities/status_tipo_pagamento_transacao_entity.dart';

class TransacaoPageParams {
  final int valorEmCentavos;
  final StatusTipoPagamentoTransacaoEntity formaDePagamento;
  final int codigoConta;
  final int quantidadePessoas;
  final int valorCouvertEmCentavos;
  final bool removerGorjeta;
  final int? usuarioRemocaoGorjeta;
  final bool removerCouvert;
  final int? usuarioRemocaoCouvert;

  TransacaoPageParams({
    required this.valorEmCentavos,
    required this.formaDePagamento,
    required this.codigoConta,
    required this.quantidadePessoas,
    required this.valorCouvertEmCentavos,
    required this.removerGorjeta,
    required this.usuarioRemocaoGorjeta,
    required this.removerCouvert,
    required this.usuarioRemocaoCouvert,
  });
}
