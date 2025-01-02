import 'dart:convert';

import 'package:easyfood_app/core/usecases/result.dart';
import 'package:easyfood_app/core/usecases/usecase.dart';
import 'package:easyfood_app/features/realizar_pagamento/domain/entities/requisicao_pagamento_entity.dart';
import 'package:easyfood_app/features/transacoes/domain/entities/status_tipo_pagamento_transacao_entity.dart';
import 'package:flutter/services.dart';

class RealizarPagamentoUseCase implements UseCase<void, RealizarPagamentoParams> {
  @override
  Future<Result<void>> call(RealizarPagamentoParams params) {
    const channel = MethodChannel('flavor');
    final request = RequisicaoPagamentoEntity(
      valorEmCentavos: params.valorEmCentavos,
      formaDePagamento: params.formaDePagamento.value.split('_').last,
      sku: params.sku,
      imprimirViaEstabelecimento: params.imprimirViaEstabelecimento,
    );
    final jsonString = jsonEncode(request.toJson());
    channel.invokeMethod<String>('pay', jsonString);
    return Future.value(Result.success(null));
  }
}

class RealizarPagamentoParams {
  final int valorEmCentavos;
  final StatusTipoPagamentoTransacaoEntity formaDePagamento;
  final String sku;
  final bool imprimirViaEstabelecimento;

  RealizarPagamentoParams({
    required this.valorEmCentavos,
    required this.formaDePagamento,
    required this.sku,
    this.imprimirViaEstabelecimento = true,
  });
}
